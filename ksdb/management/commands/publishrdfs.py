#publishPublication.rdf
from rdflib import Graph, Literal, Namespace, RDF, URIRef
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import publication, publication_author_link, person, protocol, pi_protocol_link, organ_protocol_link, person_degree_link, degree, project, institution, institution_personnel_link, fundedsite, fundedsite_staff_link, fundedsite_pi_link, fundedsite_organ_link, fundedsite_project_link, fundedsite_institution_link, organ, IdSeq
from ksdb.forms import PublicationForm

#import settings
import logging
import json
logger = logging.getLogger(__name__)

class Command(BaseCommand):
    _schema = Namespace("http://mcl.jpl.nasa.gov/rdf/schema.rdf#")
    _terms = Namespace("http://purl.org/dc/terms/")
    _faof = Namespace("http://xmlns.com/foaf/0.1/")
    _mcltype = Namespace("http://mcl.jpl.nasa.gov/rdf/types.rdf#")
    _publication = Namespace("http://mcl.jpl.nasa.gov/data/pubs/")
    _protocol = Namespace("http://mcl.jpl.nasa.gov/data/protocols/")
    _person = Namespace("http://mcl.jpl.nasa.gov/data/registered-person/")
    _institution = Namespace("http://mcl.jpl.nasa.gov/data/institution/")
    _project = Namespace("http://mcl.jpl.nasa.gov/data/project/")
    _organ = Namespace("http://mcl.jpl.nasa.gov/data/body-systems/")
    _fundedsite = Namespace("http://mcl.jpl.nasa.gov/data/sites/")
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
        if 'project' in options['rdftype']:
            rdf = self.getprojectrdf()
        if 'institution' in options['rdftype']:
            rdf = self.getinstitutionrdf()
        if 'fundedsite' in options['rdftype']:
            rdf = self.getfundedsiterdf()
        if 'person' in options['rdftype']:
            rdf = self.getpersonrdf()
        if 'organ' in options['rdftype']:
            rdf = self.getorganrdf()

        return str(rdf)

    def getpublicationrdf(self):
        #obj.id, obj.title, obj.authors, obj.pubmedid

        for pub in list(publication.objects.all()):
            pubi = URIRef(self._publication[str(pub.id)])
            self._graph.add( (pubi, RDF.type, self._mcltype.Publication) )
            for ppl in list(publication_author_link.objects.filter(publicationid=pub.id)):
                per = person.objects.filter(id=ppl.personid)
                if len(per) > 0:
                    name = per[0].firstname+" "+per[0].lastname
                    self._graph.add( (pubi, self._terms.author, Literal(name)) )
            self._graph.add( (pubi, self._schema.journal, Literal(pub.journal)) )
            self._graph.add( (pubi, self._terms.title, Literal(pub.title)) )
            self._graph.add( (pubi, self._terms.pmid, Literal(pub.pubmedid)) )
            self._graph.add( (pubi, self._schema.year, Literal(pub.pubyear)) )
            #missing pubURL
            #missing year from date
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
            #organs
            for org in list(organ_protocol_link.objects.filter(protocolid=pro.id)):
                self._graph.add( (proi, self._schema.organ, URIRef(self._organ[str(org.organid)])) )
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
            self._graph.add( (proi, self._schema.abstract, Literal(pro.abstract)) )
            #sitecontact
            self._graph.add( (proi, self._schema.sitecontact, Literal(pro.site_contact)) )
            #irbcontact
            self._graph.add( (proi, self._schema.irbcontact, URIRef(pro.irb_contact)) )
            
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
            degind = 1
            for deg in list(person_degree_link.objects.filter(personid=per.id)):
                degi = degree.objects.filter(id=deg.degreeid)
                if len(degi) > 0:
                    self._graph.add( (peri, self._schema["degree"+str(degind)], Literal(degi[0].title)) )
                degind += 1

        return  self._graph.serialize(format='xml')

    def getprojectrdf(self):
        for pro in list(project.objects.all()):
            proi = URIRef(self._project[str(pro.id)])
            self._graph.add( (proi, RDF.type, self._mcltype.Project) )
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
            self._graph.add( (insi, self._terms.department, Literal(ins.department)) )
            #url
            self._graph.add( (insi, self._terms.url, Literal(ins.url)) )
            #personnel member
            for ppl in list(institution_personnel_link.objects.filter(institutionid=ins.id)):
                self._graph.add( (insi, self._schema.member, URIRef(self._person[str(ppl.personid)])) )

        return  self._graph.serialize(format='xml')

    def getfundedsiterdf(self):
        for fun in list(fundedsite.objects.all()):
            funi = URIRef(self._fundedsite[str(fun.id)])
            self._graph.add( (funi, RDF.type, self._mcltype.FundedSite) )
            #description
            self._graph.add( (funi, self._terms.description, Literal(fun.description)) )
            #staff
            for ppl in list(fundedsite_staff_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.staff, URIRef(self._person[str(ppl.personid)])) )
            #pis
            for ppl in list(fundedsite_pi_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.pi, URIRef(self._person[str(ppl.personid)])) )
            #organs
            for org in list(fundedsite_organ_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.organ, URIRef(self._organ[str(org.organid)])) )
            #projects
            for pro in list(fundedsite_project_link.objects.filter(fundedsiteid=fun.id)):
                self._graph.add( (funi, self._schema.project, URIRef(self._project[str(pro.projectid)])) )
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
