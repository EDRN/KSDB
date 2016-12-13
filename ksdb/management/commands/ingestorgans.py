# ingestorgans.py
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import organ, IdSeq
from ksdb.forms import OrganForm

import rdflib
from rdflib.term import URIRef, Literal

#import settings
import logging
import json
logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Ingest publications'
    organurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/body-systems/@@rdf"
    _bodySystemTitle = URIRef("http://purl.org/dc/terms/title")

    def handle(self, *args, **options):
        g = rdflib.Graph()
        result = g.parse(self.organurl)
        imported_count = 0
        organStatements = self._parseRDF(g)
        for body in organStatements:
            for title in organStatements[body][self._bodySystemTitle]:
                if not self._exists(title):
                    parameters = {}
                    org_id = IdSeq.objects.raw("select sequence_name, nextval('organ_seq') from organ_seq")[0].nextval
                    parameters["id"] = org_id
                    parameters["name"] = title
                    parameters["description"] = ""
                    organm = OrganForm(parameters)

                    if organm.is_valid():
                        organm.save()
                        imported_count += 1
        logger.info("Successfully imported {} organs from cancerdataexpo rdf.".format(imported_count))
    def _exists(self, name):
        #returns true if no object exist, returns false if one or more object exist
        exist = True
        try:
            organ.objects.get(name=name)
        except organ.DoesNotExist:
            exist = False
            pass
        except organ.MultipleObjectsReturned:
            pass
        return exist
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


