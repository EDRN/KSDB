from django.core.management.base import BaseCommand
from rdflib.term import URIRef

from ksdb.models import organ
from ksdb.rdf_ingest_utils import fetch_rdf_graph, next_sequence_value, parse_statements, text_value

import logging


logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Ingest organs from the EDRN RDF feed."
    organurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/body-systems/@@rdf"
    _body_system_title = URIRef("http://purl.org/dc/terms/title")

    def handle(self, *args, **options):
        graph = fetch_rdf_graph(self.organurl)
        statements = parse_statements(graph)
        imported_count = 0

        for subject in statements:
            title = text_value(statements[subject].get(self._body_system_title, [""])[0])
            if not title:
                continue
            if organ.objects.filter(name=title).exists():
                continue

            organ.objects.create(
                id=next_sequence_value("organ_seq"),
                name=title,
                description="",
            )
            imported_count += 1

        logger.info("Successfully imported %s organs from cancerdataexpo rdf.", imported_count)
