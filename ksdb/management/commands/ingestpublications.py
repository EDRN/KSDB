# ingestpublications.py
from django.core.management.base import BaseCommand, CommandError
from ksdb.models import publication, IdSeq
from ksdb.forms import PublicationForm

import rdflib
from rdflib.term import URIRef, Literal

#import settings
import logging
import json
logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Ingest publications'
    publicationurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/publications/@@rdf"
    #Well-known URI refs
    _publicationTypeURI = URIRef('http://edrn.nci.nih.gov/rdf/types.rdf#Publication')
    _typeURI            = URIRef('http://www.w3.org/1999/02/22-rdf-syntax-ns#type')
    _pmidURI            = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#pmid')
    _yearURI            = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#year')
    _journalURI         = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#journal')
    _authorURI          = URIRef('http://purl.org/dc/terms/author')
    _titleURI           = URIRef('http://purl.org/dc/terms/title')
    _volumeURI          = URIRef('http://edrn.nci.nih.gov/rdf/schema.rdf#volume')

    def handle(self, *args, **options):
        g = rdflib.Graph()
        result = g.parse(self.publicationurl)

        pubStatements = self._parseRDF(g)
        for pub in pubStatements:
            if self._titleURI not in pubStatements[pub] or self._pmidURI not in pubStatements[pub] or self._yearURI not in pubStatements[pub] or self._journalURI not in pubStatements[pub] or self._authorURI not in pubStatements[pub]:
                continue
            titles   = pubStatements[pub][self._titleURI]
            pmids    = pubStatements[pub][self._pmidURI]
            years    = pubStatements[pub][self._yearURI]
            journals = pubStatements[pub][self._journalURI]
            authors  = pubStatements[pub][self._authorURI]
            title = None
            pmid = None
            year = None
            journal = None
            if len(titles) < 1:
                continue
            else:
                title = titles[0]
            if len(pmids) < 1:
                continue
            else:
                pmid = pmids[0]
            if len(years) < 1:
                continue
            else:
                year = years[0]
            if len(journals) < 1:
                continue
            else:
                journal = journals[0]

            parameters = {}
            pub_id = IdSeq.objects.raw("select sequence_name, nextval('publication_seq') from publication_seq")[0].nextval
            
            parameters["id"] = pub_id
            parameters["title"] = title
            parameters["authors"] = ", ".join(authors)
            parameters["pubmedid"] = pmid
            parameters["pubyear"] = year
            parameters["journal"] = journal
            
            publicationm = PublicationForm(parameters)

            if publicationm.is_valid():
                    publicationm.save()
        print "Successfully imported publication from cancerdataexpo rdf."

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


