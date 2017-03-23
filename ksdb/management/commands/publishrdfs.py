#publishPublication.rdf
from rdflib import Graph, Literal, Namespace, RDF, URIRef
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import publication, publication_author_link, person, protocol, pi_protocol_link, organ_protocol_link, person_degree_link, degree, program, institution, institution_personnel_link, fundedsite, fundedsite_staff_link, fundedsite_pi_link, fundedsite_organ_link, fundedsite_program_link, fundedsite_institution_link, organ, species, specimentype, discipline, IdSeq, disease, group, group_member_link, con_fundedsite_link, protocol_custodian_link,protocol_publication_link, fundedsite_protocol_link, group_program_link, ci_protocol_link, committee, committee_member_link, committee_program_link, group_chair_link, group_cochair_link
from ksdb.forms import PublicationForm

#import settings
from sitemain import settings
import logging
import json
import re

logger = logging.getLogger(__name__)

class Command(BaseCommand):
    _baseurl = settings.RDF_URL
    _schema = Namespace("https://cancer.jpl.nasa.gov/rdf/schema.rdf#")
    _terms = Namespace("http://purl.org/dc/terms/")
    _faof = Namespace("http://xmlns.com/foaf/0.1/")
    _cancertype = Namespace("https://cancer.jpl.nasa.gov/rdf/types.rdf#")
    _publication = Namespace(_baseurl+"ksdb/publicationinput/?id=")
    _committee = Namespace(_baseurl+"ksdb/committeeinput/?id=")
    _protocol = Namespace(_baseurl+"ksdb/protocolinput/?id=")
    _person = Namespace(_baseurl+"ksdb/personinput/?id=")
    _degree = Namespace(_baseurl+"ksdb/degreeinput/?id=")
    _institution = Namespace(_baseurl+"ksdb/institutioninput/?id=")
    _program = Namespace(_baseurl+"ksdb/programinput/?id=")
    _group = Namespace(_baseurl+"ksdb/groupinput/?id=")
    _organ = Namespace(_baseurl+"ksdb/organinput/?id=")
    _species = Namespace(_baseurl+"ksdb/speciesinput/?id=")
    _specimentype = Namespace(_baseurl+"ksdb/specimentypeinput/?id=")
    _discipline = Namespace(_baseurl+"ksdb/disciplineinput/?id=")
    _disease = Namespace(_baseurl+"ksdb/diseaseinput/?id=")
    _fundedsite = Namespace(_baseurl+"ksdb/fundedsiteinput/?id=")

    _graph = None


    def add_arguments(self, parser):
        parser.add_argument('rdftype', nargs=1, type=str)
        parser.add_argument('filterby', nargs=1, type=str)
        parser.add_argument('filterval', nargs=1, type=str)

    def handle(self, *args, **options):
        rdf = None
        self._graph = Graph()
        filterobj = None
        if options['filterby'][0] == "program":
            filterobj = program
        if 'publication' in options['rdftype']:
            rdf = self.getpublicationrdf(filterobj, options['filterval'])
        if 'protocol' in options['rdftype']:
            rdf = self.getprotocolrdf(filterobj, options['filterval'])
        if 'program' in options['rdftype']:
            rdf = self.getprogramrdf()
        if 'institution' in options['rdftype']:
            rdf = self.getinstitutionrdf(filterobj, options['filterval'])
        if 'group' in options['rdftype']:
            rdf = self.getgrouprdf(filterobj, options['filterval'])
        if 'committee' in options['rdftype']:
            rdf = self.getcommitteerdf(filterobj, options['filterval'])
        if 'fundedsite' in options['rdftype']:
            rdf = self.getfundedsiterdf(filterobj, options['filterval'])
        if 'person' in options['rdftype']:
            rdf = self.getpersonrdf(filterobj, options['filterval'])
        if 'organ' in options['rdftype']:
            rdf = self.getorganrdf()
        if 'discipline' in options['rdftype']:
            rdf = self.getdisciplinerdf()
        if 'specimentype' in options['rdftype']:
            rdf = self.getspecimentyperdf()
        if 'species' in options['rdftype']:
            rdf = self.getspeciesrdf()
        if 'disease' in options['rdftype']:
            rdf = self.getdiseaserdf()
        if 'degree' in options['rdftype']:
            rdf = self.getdegreerdf()

        return str(rdf)

    def getpublicationrdf(self, filterobj, filterval):
        pubs = None
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            fpr = fundedsite_protocol_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            ppl = protocol_publication_link.objects.filter(protocolid__in = [obj.protocolid for obj in fpr])
            pubs = publication.objects.filter(id__in = [obj.publicationid for obj in ppl])
        else:
            pubs = publication.objects.all()
        if pubs:
            for pub in pubs:
                pubi = URIRef(self._publication[str(pub.id)])
                self._graph.add( (pubi, RDF.type, self._cancertype.Publication) )
                #currently not linking authors to internal people database yet, displaying author as text
                #for ppl in list(publication_author_link.objects.filter(publicationid=pub.id)):
                #    per = person.objects.filter(id=ppl.personid)
                #    if len(per) > 0:
                #        name = per[0].firstname+" "+per[0].lastname
                #        self._graph.add( (pubi, self._terms.author, Literal(name)) )
                if pub.authors:
                    for pplname in re.split(', | and ',pub.authors):
                        pplname = pplname.strip()
                        if pplname != '':
                            self._graph.add( (pubi, self._schema.author, Literal(pplname)) )
                if pub.journal:
                    self._graph.add( (pubi, self._schema.journal, Literal(pub.journal)) )
                if pub.title:
                    self._graph.add( (pubi, self._terms.title, Literal(pub.title)) )
                if pub.pubmedid:
                    self._graph.add( (pubi, self._schema.pmid, Literal(pub.pubmedid)) )
                if pub.pubyear:
                    self._graph.add( (pubi, self._schema.year, Literal(pub.pubyear)) )
                #missing volume
                #self._graph.add( (pubi, _schema.pubURL, URIRef("http://cebp.aacrjournals.org/")) )

        return  self._graph.serialize(format='xml')

    def getprotocolrdf(self, filterobj, filterval):
        prots = None
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            fpr = fundedsite_protocol_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            prots = protocol.objects.filter(id__in = [obj.protocolid for obj in fpr])
        else:
            prots = protocol.objects.all()
        for pro in prots:
            proi = URIRef(self._protocol[str(pro.id)])
            self._graph.add( (proi, RDF.type, self._cancertype.Protocol) )
            #pis
            for ppl in list(pi_protocol_link.objects.filter(protocolid=pro.id)):
                self._graph.add( (proi, self._schema.pi, URIRef(self._person[str(ppl.id)])) )
            #custodian
            for ppl in list(protocol_custodian_link.objects.filter(protocolid=pro.id)):
                self._graph.add( (proi, self._schema.custodian, URIRef(self._person[str(ppl.id)])) )
            #organs
            for org in list(organ_protocol_link.objects.filter(protocolid=pro.id)):
                self._graph.add( (proi, self._schema.organ, URIRef(self._organ[str(org.organid)])) )
            #publications
            for pub in list(protocol_publication_link.objects.filter(protocolid=pro.id)):
                self._graph.add( (proi, self._schema.publication, URIRef(self._publication[str(pub.publicationid)])) )
            #participating sites
            for site in list(fundedsite_protocol_link.objects.filter(protocolid=pro.id)):
                self._graph.add( (proi, self._schema.site, URIRef(self._fundedsite[str(site.fundedsiteid)])) )
            #title
            if pro.title:
                self._graph.add( (proi, self._terms.title, Literal(str(pro.title).encode("ascii", "ignore"))) )
            #startdate
            if pro.start_date:
                self._graph.add( (proi, self._schema.startDate, Literal(pro.start_date)) )
            #irbapproval
            if pro.irb_approval:
                self._graph.add( (proi, self._schema.irbapproval, Literal(pro.irb_approval)) )
            #irbapprovalnum
            if pro.irb_approval_num:
                self._graph.add( (proi, self._schema.irbapprovalnum, Literal(pro.irb_approval_num)) )
            #human subject training
            if pro.hum_sub_train:
                self._graph.add( (proi, self._schema.humanSubjectTraining, Literal(pro.hum_sub_train)) )
            #abstract
            if pro.abstract:
                self._graph.add( (proi, self._terms.abstract, Literal(pro.abstract)) )
            #sitecontact
            if pro.site_contact:
                self._graph.add( (proi, self._schema.sitecontact, Literal(pro.site_contact)) )
            #irbcontact
            if pro.irb_contact:
                self._graph.add( (proi, self._schema.irbcontact, URIRef(pro.irb_contact)) )
            
        return  self._graph.serialize(format='xml')

    def getpersonrdf(self, filterobj, filterval):
        pers = None
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
            peri = URIRef(self._person[str(per.id)])
            self._graph.add( (peri, RDF.type, self._cancertype.Person) )
            #lastname
            if per.lastname:
                self._graph.add( (peri, self._faof.surname, Literal(per.lastname)) )
            #firstname
            if per.firstname:
                self._graph.add( (peri, self._faof.givenname, Literal(per.firstname)) )
            #email
            if per.email:
                self._graph.add( (peri, self._faof.mbox, Literal(per.email)) )
            #phone
            if per.telephone:
                self._graph.add( (peri, self._faof.phone, Literal(per.telephone)) )
            #dcp and dcb flag
            if per.dcb:
                self._graph.add( (peri, self._schema.has_dcb, Literal(per.dcb)) )
            if per.dcp:
                self._graph.add( (peri, self._schema.has_dcp, Literal(per.dcp)) )
            #degree
            for deg in list(person_degree_link.objects.filter(personid=per.id)):
                self._graph.add( (peri, self._schema.degree, URIRef(self._degree[str(deg.degreeid)]) ))

        return  self._graph.serialize(format='xml')

    def getdegreerdf(self):
        for deg in list(degree.objects.all()):
            degi = URIRef(self._degree[str(deg.id)])
            self._graph.add( (degi, RDF.type, self._cancertype.Degree) )
            #title
            if deg.title:
                self._graph.add( (degi, self._terms.title, Literal(deg.title)) )
            #description
            if deg.description:
                self._graph.add( (degi, self._terms.description, Literal(deg.description)) )

        return  self._graph.serialize(format='xml')

    def getprogramrdf(self):
        for pro in list(program.objects.all()):
            proi = URIRef(self._program[str(pro.id)])
            self._graph.add( (proi, RDF.type, self._cancertype.Program) )
            #title
            if pro.title:
                self._graph.add( (proi, self._terms.title, Literal(pro.title)) )
            #abbreviation
            if pro.abbreviation:
                self._graph.add( (proi, self._schema.abbreviatedName, Literal(pro.abbreviation)) )
            #description
            if pro.description:
                self._graph.add( (proi, self._terms.description, Literal(pro.description)) )

        return  self._graph.serialize(format='xml')

    def getcommitteerdf(self, filterobj, filterval):
        coms = None
        if filterobj is program:
            cpl = committee_program_link.objects.filter(programid__in = filterval)

            coms = committee.objects.filter(id__in = [obj.committeeid for obj in cpl])
        else:
            coms = committee.objects.all()
        for com in coms:
            comi = URIRef(self._committee[str(com.id)])
            self._graph.add( (comi, RDF.type, self._cancertype.Group) )
            #name
            if com.title:
                self._graph.add( (comi, self._terms.title, Literal(com.title)) )
            #description
            if com.description:
                self._graph.add( (comi, self._terms.description, Literal(com.description)) )
            #abbreviation
            if com.abbreviation:
                self._graph.add( (comi, self._schema.abbreviatedName, Literal(com.abbreviation)) )
            #committee member
            for ppl in list(committee_member_link.objects.filter(committeeid=com.id)):
                self._graph.add( (comi, self._faof.member, URIRef(self._person[str(ppl.personid)])) )

        return  self._graph.serialize(format='xml')

    def getgrouprdf(self, filterobj, filterval):
        grps = None
        if filterobj is program:
            gpl = group_program_link.objects.filter(programid__in = filterval)

            grps = group.objects.filter(id__in = [obj.groupid for obj in gpl])
        else:
            grps = group.objects.all()
        for grp in grps:
            grpi = URIRef(self._group[str(grp.id)])
            self._graph.add( (grpi, RDF.type, self._cancertype.Group) )
            #name
            if grp.name:
                self._graph.add( (grpi, self._terms.title, Literal(grp.name)) )
            #description
            if grp.description:
                self._graph.add( (grpi, self._terms.description, Literal(grp.description)) )
            #group member, chair, cochair
            for ppl in list(group_member_link.objects.filter(groupid=grp.id)):
                self._graph.add( (grpi, self._faof.member, URIRef(self._person[str(ppl.personid)])) )
            for ppl in list(group_chair_link.objects.filter(groupid=grp.id)):
                self._graph.add( (grpi, self._schema.chair, URIRef(self._person[str(ppl.personid)])) )
            for ppl in list(group_cochair_link.objects.filter(groupid=grp.id)):
                self._graph.add( (grpi, self._schema.cochair, URIRef(self._person[str(ppl.personid)])) )

        return  self._graph.serialize(format='xml')

    def getinstitutionrdf(self, filterobj, filterval):
        ints = None
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            fil = fundedsite_institution_link.objects.filter(fundedsiteid__in = [obj.fundedsiteid for obj in fpl])
            ints = institution.objects.filter(id__in = [obj.institutionid for obj in fil])
        else:
            ints = institution.objects.all()
        for ins in ints:
            insi = URIRef(self._institution[str(ins.id)])
            self._graph.add( (insi, RDF.type, self._cancertype.Institution) )
            #name
            if ins.name:
                self._graph.add( (insi, self._terms.title, Literal(ins.name)) )
            #abbreviation
            if ins.abbreviation:
                self._graph.add( (insi, self._schema.abbreviatedName, Literal(ins.abbreviation)) )
            #description
            if ins.description:
                self._graph.add( (insi, self._terms.description, Literal(ins.description)) )
            #department
            if ins.department:
                self._graph.add( (insi, self._schema.department, Literal(ins.department)) )
            #url
            if ins.url:
                self._graph.add( (insi, self._faof.homepage, URIRef(ins.url)) )
            #personnel member
            for ppl in list(institution_personnel_link.objects.filter(institutionid=ins.id)):
                self._graph.add( (insi, self._faof.member, URIRef(self._person[str(ppl.personid)])) )

        return  self._graph.serialize(format='xml')

    def getfundedsiterdf(self, filterobj, filterval):
        funs = None
        if filterobj is program:
            fpl = fundedsite_program_link.objects.filter(programid__in = filterval)
            funs = fundedsite.objects.filter(id__in = [obj.fundedsiteid for obj in fpl])
        else:
            funs = fundedsite.objects.all()
        for fun in funs:
            funi = URIRef(self._fundedsite[str(fun.id)])
            self._graph.add( (funi, RDF.type, self._cancertype.FundedSite) )
            #name
            if fun.name:
                self._graph.add( (funi, self._terms.title, Literal(fun.name)) )
            #description
            if fun.description:
                self._graph.add( (funi, self._terms.description, Literal(fun.description)) )
            #abstract
            if fun.abstract:
                self._graph.add( (funi, self._terms.abstract, Literal(fun.abstract)) )
            #abbreviation
            if fun.abbreviation:
                self._graph.add( (funi, self._schema.abbreviatedName, Literal(fun.abbreviation)) )
            #aims
            if fun.aims:
                self._graph.add( (funi, self._schema.aims, Literal(fun.aims)) )
            #funding start date
            if fun.funding_date_start:
                self._graph.add( (funi, self._schema.fundingStartDate, Literal(fun.funding_date_start)) )
            #funding finish date
            if fun.funding_date_finish:
                self._graph.add( (funi, self._schema.fundingFinishDate, Literal(fun.funding_date_finish)) )
            #staff
            for ppl in list(fundedsite_staff_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.staff, URIRef(self._person[str(ppl.personid)])) )
            #pis
            for ppl in list(fundedsite_pi_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.pi, URIRef(self._person[str(ppl.personid)])) )
            #contacts
            for ppl in list(con_fundedsite_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.contact, URIRef(self._person[str(ppl.personid)])) )
            #organs
            for org in list(fundedsite_organ_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.organ, URIRef(self._organ[str(org.organid)])) )
            #programs
            for pro in list(fundedsite_program_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.program, URIRef(self._program[str(pro.programid)])) )
            #institutuions
            for ins in list(fundedsite_institution_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.institution, URIRef(self._institution[str(ins.institutionid)])) )

        return  self._graph.serialize(format='xml')

    def getorganrdf(self):
        for org in list(organ.objects.all()):
            orgi = URIRef(self._organ[str(org.id)])
            self._graph.add( (orgi, RDF.type, self._cancertype.Organ) )
            #name
            if org.name:
                self._graph.add( (orgi, self._terms.title, Literal(org.name)) )
            #description
            if org.description:
                self._graph.add( (orgi, self._terms.description, Literal(org.description)) )

        return  self._graph.serialize(format='xml')

    def getspeciesrdf(self):
        for spe in list(species.objects.all()):
            spei = URIRef(self._species[str(spe.id)])
            self._graph.add( (spei, RDF.type, self._cancertype.Species) )
            #name
            if spe.title:
                self._graph.add( (spei, self._terms.title, Literal(spe.title)) )
            #description
            if spe.description:
                self._graph.add( (spei, self._terms.description, Literal(spe.description)) )

        return  self._graph.serialize(format='xml')

    def getspecimentyperdf(self):
        for spe in list(specimentype.objects.all()):
            spei = URIRef(self._specimentype[str(spe.id)])
            self._graph.add( (spei, RDF.type, self._cancertype.SpecimenType) )
            #name
            if spe.title:
                self._graph.add( (spei, self._terms.title, Literal(spe.title)) )
            #description
            if spe.description:
                self._graph.add( (spei, self._terms.description, Literal(spe.description)) )

        return  self._graph.serialize(format='xml')

    def getdisciplinerdf(self):
        for dis in list(discipline.objects.all()):
            disi = URIRef(self._discipline[str(dis.id)])
            self._graph.add( (disi, RDF.type, self._cancertype.Discipline) )
            #name
            if dis.title:
                self._graph.add( (disi, self._terms.title, Literal(dis.title)) )
            #description
            if dis.description:
                self._graph.add( (disi, self._terms.description, Literal(dis.description)) )

        return  self._graph.serialize(format='xml')

    def getdiseaserdf(self):
        for dis in list(disease.objects.all()):
            disi = URIRef(self._disease[str(dis.id)])
            self._graph.add( (disi, RDF.type, self._cancertype.Disease) )
            #name
            if dis.icd10:
                self._graph.add( (disi, self._terms.title, Literal(dis.icd10)) )
            #description
            if dis.description:
                self._graph.add( (disi, self._terms.description, Literal(dis.description)) )

        return  self._graph.serialize(format='xml')
