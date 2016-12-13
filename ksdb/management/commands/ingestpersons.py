# ingestpersons.py
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import person, degree, person_degree_link, IdSeq
from ksdb.forms import PersonForm, DegreeForm

import rdflib
from rdflib.term import URIRef, Literal

#import settings
import logging
import json
logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Ingest Registered person'
    personurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/registered-person/@@rdf"
    #Well-known URI refs
    _personTypeURI = URIRef('http://edrn.nci.nih.gov/rdf/types.rdf#Person')
    _firstnameURI  = URIRef('http://xmlns.com/foaf/0.1/givenname')
    _lastnameURI   = URIRef('http://xmlns.com/foaf/0.1/surname')
    _phoneURI      = URIRef('http://xmlns.com/foaf/0.1/phone')
    _mboxURI       = URIRef('http://xmlns.com/foaf/0.1/mbox')
    _degree1URI    = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#degree1')
    _degree2URI    = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#degree2')
    _degree3URI    = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#degree3')

    def checkdegree(self, deg):
        degids = []
        deglist = list(degree.objects.filter(title=deg))
        logger.warn("DEGREE")
        logger.warn(len(deglist))
        if len(deglist) > 0:
            logger.warn("GOT HERE")
            for d in deglist:
                degids.append(d.id)
        else:
            logger.warn("NEW")
            newid = self.adddegree(deg)
            degids.append(newid)
        logger.warn("HERE")
        logger.warn(degids)
        return degids

    def adddegree(self, degree):
        parameters = {}
        deg_id = IdSeq.objects.raw("select sequence_name, nextval('degree_seq') from degree_seq")[0].nextval
        parameters["id"] = deg_id
        parameters["title"] = degree.encode('utf-8').strip()

        degreem = DegreeForm(parameters)
        if degreem.is_valid():
            degreem.save()        
        return deg_id

    def handle(self, *args, **options):
        g = rdflib.Graph()
        result = g.parse(self.personurl)
        imported_count = 0
        personStatements = self._parseRDF(g)
        for per in personStatements:
            if self._firstnameURI not in personStatements[per] or self._lastnameURI not in personStatements[per] or self._mboxURI not in personStatements[per]:
                continue
            parameters = {}
            firstname = personStatements[per][self._firstnameURI]
            lastname = personStatements[per][self._lastnameURI]
            email = personStatements[per][self._mboxURI]
            per_id = None

            if len(firstname) > 0:
                parameters["firstname"] = firstname[0].encode('utf-8').strip()
            if len(lastname) > 0:
                parameters["lastname"] = lastname[0].encode('utf-8').strip()
            if len(email) > 0:
                parameters["email"] = str(email[0].encode('utf-8').strip()).replace("mailto:","")

            existingpers = person.objects.filter(firstname=firstname, lastname=lastname)
            if len(list(existingpers)) > 0:
                per_id = existingpers[0]
            else:
                per_id = IdSeq.objects.raw("select sequence_name, nextval('person_seq') from person_seq")[0].nextval

            if self._phoneURI in personStatements[per]:
                if len(personStatements[per][self._phoneURI]) > 0:
                    parameters["telephone"] = personStatements[per][self._phoneURI][0].encode('utf-8').strip()
            degids = []
            if self._degree1URI in personStatements[per]:
                if len(personStatements[per][self._degree1URI]) > 0:
                    deg = str(personStatements[per][self._degree1URI][0])
                    dlist = self.checkdegree(deg)
                    degids += dlist
            if self._degree2URI in personStatements[per]:
                if len(personStatements[per][self._degree2URI]) > 0:
                    deg = str(personStatements[per][self._degree2URI][0])
                    dlist = self.checkdegree(deg)
                    degids += dlist
            if self._degree3URI in personStatements[per]:
                if len(personStatements[per][self._degree3URI]) > 0:
                    deg = str(personStatements[per][self._degree3URI][0])
                    dlist = self.checkdegree(deg)
                    degids += dlist

            parameters["id"] = per_id
            personm = PersonForm(parameters)
            if personm.is_valid():
                personm.save()
                for degid in degids:
                    logger.warn(per_id)
                    logger.warn(degid)
                    person_degree_linkm = person_degree_link(personid = per_id, degreeid = int(degid))
                    person_degree_linkm.save()
                imported_count += 1

        logger.info("Successfully imported {} persons from cancerdataexpo rdf into KSDB.".format(imported_count))

    def _parseRDF(self, graph):
            statements = {}
            for s, p, o in graph:
                if s not in statements:
                    statements[s] = {}
                predicates = statements[s]
                if p not in predicates:
                    predicates[p] = []
                predicates[p].append(o)
            return statements


