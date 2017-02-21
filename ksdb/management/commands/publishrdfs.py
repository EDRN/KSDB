#publishPublication.rdf
from rdflib import Graph, Literal, Namespace, RDF, URIRef
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import publication, publication_author_link, person, protocol, pi_protocol_link, organ_protocol_link, person_degree_link, degree, program, institution, institution_personnel_link, fundedsite, fundedsite_staff_link, fundedsite_pi_link, fundedsite_organ_link, fundedsite_program_link, fundedsite_institution_link, organ, IdSeq
from ksdb.forms import PublicationForm

#import settings
from sitemain import settings
import logging
import json
import re

logger = logging.getLogger(__name__)

class Command(BaseCommand):
    _baseurl = settings.SITE_URL
    _schema = Namespace("https://mcl.jpl.nasa.gov/rdf/schema.rdf#")
    _terms = Namespace("http://purl.org/dc/terms/")
    _faof = Namespace("http://xmlns.com/foaf/0.1/")
    _mcltype = Namespace("https://mcl.jpl.nasa.gov/rdf/types.rdf#")
    _publication = Namespace(_baseurl+"ksdb/publicationinput/?id=")
    _protocol = Namespace(_baseurl+"ksdb/protocolinput/?id=")
    _person = Namespace(_baseurl+"ksdb/personinput/?id=")
    _degree = Namespace(_baseurl+"ksdb/degreeinput/?id=")
    _institution = Namespace(_baseurl+"ksdb/institutioninput/?id=")
    _program = Namespace(_baseurl+"ksdb/programinput/?id=")
    _organ = Namespace(_baseurl+"ksdb/organinput/?id=")
    _fundedsite = Namespace(_baseurl+"ksdb/fundedsiteinput/?id=")
    _email = Namespace("mailto:")

    _graph = None

    def add_arguments(self, parser):
        parser.add_argument('rdftype', nargs='*', type=str)

    def handle(self, *args, **options):
        rdf = None
        self._graph = Graph()
        if 'publication' in options['rdftype']:
            rdf = self.getpublicationrdf()
        if 'protocol' in options['rdftype']:
            rdf = self.getprotocolrdf()
        if 'program' in options['rdftype']:
            rdf = self.getprogramrdf()
        if 'institution' in options['rdftype']:
            rdf = self.getinstitutionrdf()
        if 'fundedsite' in options['rdftype']:
            rdf = self.getfundedsiterdf()
        if 'person' in options['rdftype']:
            rdf = self.getpersonrdf()
        if 'organ' in options['rdftype']:
            rdf = self.getorganrdf()
        if 'degree' in options['rdftype']:
            rdf = self.getdegreerdf()

        return str(rdf)

    def getpublicationrdf(self):

        for pub in list(publication.objects.all()):
            pubi = URIRef(self._publication[str(pub.id)])
            self._graph.add( (pubi, RDF.type, self._mcltype.Publication) )
            #currently not linking authors to internal people database yet, displaying author as text
            #for ppl in list(publication_author_link.objects.filter(publicationid=pub.id)):
            #    per = person.objects.filter(id=ppl.personid)
            #    if len(per) > 0:
            #        name = per[0].firstname+" "+per[0].lastname
            #        self._graph.add( (pubi, self._terms.author, Literal(name)) )
            for pplname in re.split(', | and ',pub.authors):
                pplname = pplname.strip()
                if pplname != '':
                    self._graph.add( (pubi, self._schema.author, Literal(pplname)) )
            self._graph.add( (pubi, self._schema.journal, Literal(pub.journal)) )
            self._graph.add( (pubi, self._terms.title, Literal(pub.title)) )
            self._graph.add( (pubi, self._schema.pmid, Literal(pub.pubmedid)) )
            self._graph.add( (pubi, self._schema.year, Literal(pub.pubyear)) )
            #missing volume
            #self._graph.add( (pubi, _schema.pubURL, URIRef("http://cebp.aacrjournals.org/")) )

        return  self._graph.serialize(format='xml')

    def getprotocolrdf(self):
        for pro in list(protocol.objects.all()):
            proi = URIRef(self._protocol[str(pro.id)])
            self._graph.add( (proi, RDF.type, self._mcltype.Protocol) )
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
            #title
            self._graph.add( (proi, self._terms.title, Literal(pro.title)) )
            #startdate
            self._graph.add( (proi, self._schema.startDate, Literal(pro.start_date)) )
            #irbapproval
            self._graph.add( (proi, self._schema.irbapproval, Literal(pro.irb_approval)) )
            #irbapprovalnum
            self._graph.add( (proi, self._schema.irbapprovalnum, Literal(pro.irb_approval_num)) )
            #human subject training
            self._graph.add( (proi, self._schema.humanSubjectTraining, Literal(pro.hum_sub_train)) )
            #abstract
            self._graph.add( (proi, self._terms.abstract, Literal(pro.abstract)) )
            #sitecontact
            self._graph.add( (proi, self._schema.sitecontact, Literal(pro.site_contact)) )
            #irbcontact
            self._graph.add( (proi, self._schema.irbcontact, URIRef(self._email[pro.irb_contact])) )
            
        return  self._graph.serialize(format='xml')

    def getpersonrdf(self):
        for per in list(person.objects.all()):
            peri = URIRef(self._person[str(per.id)])
            self._graph.add( (peri, RDF.type, self._mcltype.Person) )
            #lastname
            self._graph.add( (peri, self._faof.surname, Literal(per.lastname)) )
            #firstname
            self._graph.add( (peri, self._faof.givenname, Literal(per.firstname)) )
            #email
            self._graph.add( (peri, self._faof.mbox, URIRef(self._email[per.email])) )
            #phone
            self._graph.add( (peri, self._faof.phone, Literal(per.telephone)) )
            #degree
            for deg in list(person_degree_link.objects.filter(personid=per.id)):
                self._graph.add( (peri, self._schema.degree, URIRef(self._degree[str(deg.degreeid)]) ))

        return  self._graph.serialize(format='xml')

    def getdegreerdf(self):
        for deg in list(degree.objects.all()):
            degi = URIRef(self._degree[str(deg.id)])
            self._graph.add( (degi, RDF.type, self._mcltype.Degree) )
            #title
            self._graph.add( (degi, self._terms.title, Literal(deg.title)) )
            #description
            self._graph.add( (degi, self._terms.description, Literal(deg.description)) )

        return  self._graph.serialize(format='xml')

    def getprogramrdf(self):
        for pro in list(program.objects.all()):
            proi = URIRef(self._program[str(pro.id)])
            self._graph.add( (proi, RDF.type, self._mcltype.Program) )
            #title
            self._graph.add( (proi, self._terms.title, Literal(pro.title)) )
            #abbreviation
            self._graph.add( (proi, self._schema.abbreviatedName, Literal(pro.abbreviation)) )
            #description
            self._graph.add( (proi, self._terms.description, Literal(pro.description)) )

        return  self._graph.serialize(format='xml')

    def getinstitutionrdf(self):
        for ins in list(institution.objects.all()):
            insi = URIRef(self._institution[str(ins.id)])
            self._graph.add( (insi, RDF.type, self._mcltype.Institution) )
            #name
            self._graph.add( (insi, self._terms.title, Literal(ins.name)) )
            #abbreviation
            self._graph.add( (insi, self._schema.abbreviatedName, Literal(ins.abbreviation)) )
            #description
            self._graph.add( (insi, self._terms.description, Literal(ins.description)) )
            #department
            self._graph.add( (insi, self._schema.department, Literal(ins.department)) )
            #url
            self._graph.add( (insi, self._faof.homepage, URIRef(ins.url)) )
            #personnel member
            for ppl in list(institution_personnel_link.objects.filter(institutionid=ins.id)):
                self._graph.add( (insi, self._faof.member, URIRef(self._person[str(ppl.personid)])) )

        return  self._graph.serialize(format='xml')

    def getfundedsiterdf(self):
        for fun in list(fundedsite.objects.all()):
            funi = URIRef(self._fundedsite[str(fun.id)])
            self._graph.add( (funi, RDF.type, self._mcltype.FundedSite) )
            #name
            self._graph.add( (funi, self._terms.title, Literal(fun.name)) )
            #description
            self._graph.add( (funi, self._terms.description, Literal(fun.description)) )
            #funding start date
            self._graph.add( (funi, self._schema.fundingStartDate, Literal(fun.funding_date_start)) )
            #funding finish date
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
            self._graph.add( (orgi, RDF.type, self._mcltype.Organ) )
            #name
            self._graph.add( (orgi, self._terms.title, Literal(org.name)) )
            #description
            self._graph.add( (orgi, self._terms.description, Literal(org.description)) )

        return  self._graph.serialize(format='xml')
