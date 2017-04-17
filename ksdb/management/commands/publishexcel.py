#publishPublication.excel
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import publication, publication_author_link, person, protocol, pi_protocol_link, organ_protocol_link, person_degree_link, degree, program, institution, institution_personnel_link, fundedsite, fundedsite_staff_link, fundedsite_pi_link, fundedsite_organ_link, fundedsite_program_link, fundedsite_institution_link, organ, species, specimentype, discipline, IdSeq, disease, group, group_member_link, con_fundedsite_link, protocol_custodian_link,protocol_publication_link, fundedsite_protocol_link, group_program_link, ci_protocol_link, committee, committee_member_link, committee_program_link, group_chair_link, group_cochair_link, committee_chair_link, committee_cochair_link
from ksdb.ekeutils import format_phone

#import settings
from sitemain import settings
import logging
import json
import re

logger = logging.getLogger(__name__)

class Command(BaseCommand):

    def add_arguments(self, parser):
        parser.add_argument('exceltype', nargs=1, type=str)
        parser.add_argument('filterby', nargs=1, type=str)
        parser.add_argument('filterval', nargs=1, type=str)

    def write_to_excel(self, worksheet, data):
        # Start from the first cell. Rows and columns are zero indexed.
        row = 0
        # Iterate over the data and write it out row by row.
        for row_data in (data):
            col = 0
            for val in row_data:
                worksheet.write(row, col, val)
                col += 1
            row += 1

    def handle(self, *args, **options):
        exceldata = None
        #excel = xlsxwriter.Workbook("ksdb-{}.xlsx".format(options['filterby'][0]))
        #sheet = excel.add_worksheet()
        filterobj = None
        if options['filterby'][0] == "program":
            filterobj = program
        if 'publication' in options['exceltype']:
            exceldata = self.getpublicationexcel(filterobj, options['filterval'])
        if 'protocol' in options['exceltype']:
            exceldata = self.getprotocolexcel(filterobj, options['filterval'])
        if 'program' in options['exceltype']:
            exceldata = self.getprogramexcel()
        if 'institution' in options['exceltype']:
            exceldata = self.getinstitutionexcel(filterobj, options['filterval'])
        if 'group' in options['exceltype']:
            exceldata = self.getgroupexcel(filterobj, options['filterval'])
        if 'committee' in options['exceltype']:
            exceldata = self.getcommitteeexcel(filterobj, options['filterval'])
        if 'fundedsite' in options['exceltype']:
            exceldata = self.getfundedsiteexcel(filterobj, options['filterval'])
        if 'person' in options['exceltype']:
            exceldata = self.getpersonexcel(filterobj, options['filterval'])
        if 'organ' in options['exceltype']:
            exceldata = self.getorganexcel()
        if 'discipline' in options['exceltype']:
            exceldata = self.getdisciplineexcel()
        if 'specimentype' in options['exceltype']:
            exceldata = self.getspecimentypeexcel()
        if 'species' in options['exceltype']:
            exceldata = self.getspeciesexcel()
        if 'disease' in options['exceltype']:
            exceldata = self.getdiseaseexcel()
        if 'degree' in options['exceltype']:
            exceldata = self.getdegreeexcel()
        print("EXCEL")
        print(options['exceltype'])
        print(exceldata)
        return json.dumps(exceldata)

    def getpublicationexcel(self, filterobj, filterval):
        pubs = None
        data = [
            ["ID", "Authors", "Journal", "Title", "Pubmed ID", "Pub Year"]
        ]
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            fpr = fundedsite_protocol_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            ppl = protocol_publication_link.objects.filter(protocolid__in = [obj.protocolid for obj in fpr])
            pubs = publication.objects.filter(id__in = [obj.publicationid for obj in ppl])
        else:
            pubs = publication.objects.all()
        if pubs:
            for pub in pubs:
                row = [""] * len(data[0])
                row[0] = pub.id

                authors = []
                if pub.authors:
                    for pplname in re.split(', | and ',pub.authors):
                        pplname = pplname.strip()
                        if pplname != '':
                            authors.append(pplname)
                row[1] = ",".join(authors)

                if pub.journal:
                    row[2]=pub.journal
                if pub.title:
                    row[3]=pub.title
                if pub.pubmedid:
                    row[4]=pub.pubmedid
                if pub.pubyear:
                    row[5]=pub.pubyear
                data.append(row)
        return data

    def getprotocolexcel(self, filterobj, filterval):
        prots = None
        data = [
            ["ID", "PIS", "Custodian", "Organs", "Publications", "Participating Sites", "Title", "Start Date", "IRB Approval", "IRB Approval Number", "Human Subject Training", "Abstract", "Site Contact", "IRB Contact"]
        ]
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            fpr = fundedsite_protocol_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            prots = protocol.objects.filter(id__in = [obj.protocolid for obj in fpr])
        else:
            prots = protocol.objects.all()
        for pro in prots:
            row = [""] * len(data[0])
            row[0]=pro.id
            #pis
            peoples = []
            for ppl in list(pi_protocol_link.objects.filter(protocolid=pro.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[1] = ",".join(peoples)

            #custodian
            peoples = []
            for ppl in list(protocol_custodian_link.objects.filter(protocolid=pro.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[2] = ",".join(peoples)
                
            #organs
            organs = []
            for org in list(organ_protocol_link.objects.filter(protocolid=pro.id)):
                obj = organ.objects.get(id=org.organid)
                organs.append(obj.name)
            row[3] = ",".join(organs)

            #publications
            publications = []
            for pub in list(protocol_publication_link.objects.filter(protocolid=pro.id)):
                obj = publication.objects.get(id=pub.publicationid)
                publications.append(obj.title)
            row[4] = ",".join(publications)

            #participating sites
            sites = []
            for site in list(fundedsite_protocol_link.objects.filter(protocolid=pro.id)):
                obj = fundedsite.objects.get(id=site.fundedsiteid)
                if obj.name:
                    sites.append(obj.name)
                else:
                    sites.append(str(obj.id))
            row[5] = ",".join(sites)

            #title
            if pro.title:
                row[6] = str(str(pro.title).encode("ascii", "ignore"))
            #startdate
            if pro.start_date:
                row[7] = str(pro.start_date)
            #irbapproval
            if pro.irb_approval:
                row[8] = pro.irb_approval
            #irbapprovalnum
            if pro.irb_approval_num:
                row[9] = pro.irb_approval_num
            #human subject training
            if pro.hum_sub_train:
                row[10] = pro.hum_sub_train
            #abstract
            if pro.abstract:
                row[11] = pro.abstract
            #sitecontact
            if pro.site_contact:
                row[12] = pro.site_contact
            #irbcontact
            if pro.irb_contact:
                row[13] = pro.irb_contact
            data.append(row)
        return  data

    def getpersonexcel(self, filterobj, filterval):
        pers = None
        data = [
            ["ID", "Last Name", "First Name", "Email", "Telephone", "DCP Flag", "DCB Flag", "Degree"]
        ]
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            gpl = group_program_link.objects.filter(programid__in = filterval)
            fpr = fundedsite_protocol_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])

            #all persons associated with protocols
            pipl = pi_protocol_link.objects.filter(protocolid__in = [obj.protocolid for obj in fpr])
            prcl = protocol_custodian_link.objects.filter(protocolid__in = [obj.protocolid for obj in fpr])
            cipl = ci_protocol_link.objects.filter(protocolid__in = [obj.protocolid for obj in fpr])

            #all persons associated with participating sites
            cfl = con_fundedsite_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            fpil = fundedsite_pi_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            fsl = fundedsite_staff_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            
            #all persons associated with collaborative groups
            gml = group_member_link.objects.filter(groupid__in = [obj.groupid for obj in gpl])
        
            #combine all persons
            pers = person.objects.filter(id__in = set([obj.personid for obj in list(pipl)+list(prcl)+list(cipl)+list(cfl)+list(fpil)+list(fsl)+list(gml)]))
        else:
            pers = person.objects.all()
        for per in pers:
            row = [""] * len(data[0])
            row[0] = per.id
            #lastname
            if per.lastname:
                row[1] = per.lastname
            #firstname
            if per.firstname:
                row[2] = per.firstname
            #email
            if per.email:
                row[3] = per.email
            #phone
            if per.telephone:
                phone_num = per.telephone
                new_phone = format_phone(phone_num)
                if new_phone:
                    phone_num = new_phone[0]
                    if new_phone[1] != "":
                        phone_num += " x"+new_phone[1]
                if per.extension:
                    phone_num += " x"+per.extension
                row[4] = phone_num
            #dcp and dcb flag
            if per.dcb:
                row[5] = per.dcb
            if per.dcp:
                row[6] = per.dcp
            #degree
            degrees = []
            for deg in list(person_degree_link.objects.filter(personid=per.id)):
                obj = degree.objects.get(id = deg.degreeid)
                degrees.append(obj.title)
            row[7] = ",".join(degrees)
            data.append(row)
        return data

    def getdegreeexcel(self):
        data = [
            ["ID", "Title", "Description"]
        ]
        for deg in list(degree.objects.all()):
            row = [""] * len(data[0])
            row[0] = deg.id
            #title
            if deg.title:
                row[1] = deg.title
            #description
            if deg.description:
                row[2] = deg.description
            data.append(row)

        return data

    def getprogramexcel(self):
        data = [
            ["ID", "Title", "Abbreviation", "Description"]
        ]
        for pro in list(program.objects.all()):
            row = [""] * len(data[0])
            row[0] = pro.id
            #title
            if pro.title:
                row[1] = pro.title
            #abbreviation
            if pro.abbreviation:
                row[2] = pro.abbreviation
            #description
            if pro.description:
                row[3] = pro.description
            data.append(row)

        return data

    def getcommitteeexcel(self, filterobj, filterval):
        coms = None
        if filterobj is program:
            cpl = committee_program_link.objects.filter(programid__in = filterval)

            coms = committee.objects.filter(id__in = [obj.committeeid for obj in cpl])
        else:
            coms = committee.objects.all()
        data = [
            ["ID", "Title", "Abbreviation", "Description", "Chair", "Co Chair", "Member"]
        ]
        for com in coms:
            row = [""] * len(data[0])
            row[0] = com.id
            #name
            if com.title:
                row[1] = com.title
            #description
            if com.description:
                row[3] = com.description
            #abbreviation
            if com.abbreviation:
                row[2] = com.abbreviation
            #committee chair
            peoples = []
            for ppl in list(committee_chair_link.objects.filter(committeeid=com.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[4] = ",".join(peoples)
            #committee co chair
            peoples = []
            for ppl in list(committee_cochair_link.objects.filter(committeeid=com.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[5] = ",".join(peoples)
            #committee member
            peoples = []
            for ppl in list(committee_member_link.objects.filter(committeeid=com.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[6] = ",".join(peoples)
            data.append(row)

        return data

    def getgroupexcel(self, filterobj, filterval):
        grps = None
        if filterobj is program:
            gpl = group_program_link.objects.filter(programid__in = filterval)

            grps = group.objects.filter(id__in = [obj.groupid for obj in gpl])
        else:
            grps = group.objects.all()
        data = [
            ["ID", "Name", "Description", "Chair", "Co Chair", "Member"]
        ]
        for grp in grps:
            row = [""] * len(data[0])
            row[0] = grp.id
            #name
            if grp.name:
                row[1] = grp.name
            #description
            if grp.description:
                row[2] = grp.description
            #group member, chair, cochair
            peoples = []
            for ppl in list(group_member_link.objects.filter(groupid=grp.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[5] = ",".join(peoples)
            peoples = []
            for ppl in list(group_chair_link.objects.filter(groupid=grp.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[3] = ",".join(peoples)
            peoples = []
            for ppl in list(group_cochair_link.objects.filter(groupid=grp.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[4] = ",".join(peoples)
            data.append(row)

        return data

    def getinstitutionexcel(self, filterobj, filterval):
        ints = None
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            fil = fundedsite_institution_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            ints = institution.objects.filter(id__in = [obj.institutionid for obj in fil])
        else:
            ints = institution.objects.all()
        data = [
            ["ID", "Name", "Abbreviation", "Description", "Department", "URL", "Member"]
        ]
        for ins in ints:
            row = [""] * len(data[0])
            row[0] = ins.id
            #name
            if ins.name:
                row[1] = ins.name
            #abbreviation
            if ins.abbreviation:
                row[2] = ins.abbreviation
            #description
            if ins.description:
                row[3] = ins.description
            #department
            if ins.department:
                row[4] = ins.department
            #url
            if ins.url:
                row[5] = ins.url
            #personnel member
            peoples = []
            for ppl in list(institution_personnel_link.objects.filter(institutionid=ins.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[6] = ",".join(peoples)
            data.append(row)

        return data

    def getfundedsiteexcel(self, filterobj, filterval):
        funs = None
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            funs = fundedsite.objects.filter(id__in = [obj.fundedsiteid for obj in fpl])
        else:
            funs = fundedsite.objects.all()
        data = [
            ["ID", "Name", "Description", "abstract", "abbreviation", "aims", "funding start date", "funding finish date", "Staff", "PIS", "Contacts", "Organs", "Programs", "Institutions"]
        ]
        for fun in funs:
            row = [""] * len(data[0])
            row[0] = fun.id
            #name
            if fun.name:
                row[1] = fun.name
            #description
            if fun.description:
                row[2] = fun.description
            #abstract
            if fun.abstract:
                row[3] = fun.abstract
            #abbreviation
            if fun.abbreviation:
                row[4] = fun.abbreviation
            #aims
            if fun.aims:
                row[5] = fun.aims
            #funding start date
            if fun.funding_date_start:
                row[6] = str(fun.funding_date_start)
            #funding finish date
            if fun.funding_date_finish:
                row[7] = str(fun.funding_date_finish)
            #staff
            peoples = []
            for ppl in list(fundedsite_staff_link.objects.filter(fundedsiteid=fun.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[8] = ",".join(peoples)
            #pis
            peoples = []
            for ppl in list(fundedsite_pi_link.objects.filter(fundedsiteid=fun.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[9] = ",".join(peoples)
            #contacts
            peoples = []
            for ppl in list(con_fundedsite_link.objects.filter(fundedsiteid=fun.id)):
                obj = person.objects.get(id=ppl.personid)
                peoples.append(obj.firstname+" "+obj.lastname)
            row[10] = ",".join(peoples)
            #organs
            organs = []
            for org in list(fundedsite_organ_link.objects.filter(fundedsiteid=fun.id)):
                obj = organ.objects.get(id=org.organid)
                organs.append(obj.name)
            row[11] = ",".join(organs)
            #programs
            programs = []
            for pro in list(fundedsite_program_link.objects.filter(fundedsiteid=fun.id)):
                obj = program.objects.get(id=pro.programid)
                programs.append(obj.title)
            row[12] = ",".join(programs)
            #institutions
            institutions = []
            for ins in list(fundedsite_institution_link.objects.filter(fundedsiteid=fun.id)):
                obj = institution.objects.get(id=ins.institutionid)
                institutions.append(obj.name)
            row[13] = ",".join(institutions)
            data.append(row)

        return data

    def getorganexcel(self):
        data = [
            ["ID", "Name", "Description"]
        ]
        for org in list(organ.objects.all()):
            row = [""] * len(data[0])
            row[0] = org.id
            #name
            if org.name:
                row[1] = org.name
            #description
            if org.description:
                row[2] = org.description
            data.append(row)

        return data

    def getspeciesexcel(self):
        data = [
            ["ID", "Title", "Description"]
        ]
        for spe in list(species.objects.all()):
            row = [""] * len(data[0])
            row[0] = spe.id
            #name
            if spe.title:
                row[1] = spe.title
            #description
            if spe.description:
                row[2] = spe.description
            data.append(row)

        return data

    def getspecimentypeexcel(self):
        data = [
            ["ID", "Title", "Description"]
        ]
        for spe in list(specimentype.objects.all()):
            row = [""] * len(data[0])
            row[0] = spe.id
            #title
            if spe.title:
                row[1] = spe.title
            #description
            if spe.description:
                row[2] = spe.description
            data.append(row)

        return data

    def getdisciplineexcel(self):
        data = [
            ["ID", "Title", "Description"]
        ]
        for dis in list(discipline.objects.all()):
            row = [""] * len(data[0])
            row[0] = dis.id
            #name
            if dis.title:
                row[1] = dis.title
            #description
            if dis.description:
                row[2] = dis.description
            data.append(row)

        return data

    def getdiseaseexcel(self):
        data = [
            ["ID", "ICD10", "Description"]
        ]
        for dis in list(disease.objects.all()):
            row = [""] * len(data[0])
            row[0] = dis.id
            #name
            if dis.icd10:
                row[1] = dis.icd10
            #description
            if dis.description:
                row[2] = dis.description
            data.append(row)

        return data
