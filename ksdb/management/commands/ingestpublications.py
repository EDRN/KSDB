from django.core.management.base import BaseCommand
from django.db import transaction
from rdflib.term import URIRef

from ksdb.models import publication, publication_program_link
from ksdb.rdf_ingest_utils import (
    ensure_default_programs,
    fetch_rdf_graph,
    next_sequence_value,
    parse_statements,
    text_value,
)

import logging


logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Ingest publications from the EDRN RDF feed."
    publicationurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/publications/@@rdf"
    _pmid_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#pmid")
    _year_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#year")
    _journal_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#journal")
    _author_uri = URIRef("http://purl.org/dc/terms/author")
    _title_uri = URIRef("http://purl.org/dc/terms/title")

    def handle(self, *args, **options):
        graph = fetch_rdf_graph(self.publicationurl)
        statements = parse_statements(graph)
        imported_count = 0
        updated_count = 0

        with transaction.atomic():
            ensure_default_programs()
            for subject in statements:
                title = text_value(statements[subject].get(self._title_uri, [""])[0])
                pmid = text_value(statements[subject].get(self._pmid_uri, [""])[0])
                year = text_value(statements[subject].get(self._year_uri, [""])[0])
                journal = text_value(statements[subject].get(self._journal_uri, [""])[0])
                authors = [text_value(author) for author in statements[subject].get(self._author_uri, [])]

                if not (title and pmid and year and journal and authors):
                    continue

                try:
                    pubyear = int(year)
                except (TypeError, ValueError):
                    continue

                defaults = {
                    "title": title,
                    "authors": ", ".join([author for author in authors if author]),
                    "journal": journal,
                    "pubyear": pubyear,
                    "programs": "2",
                }
                existing = publication.objects.filter(pubmedid=pmid).first()

                if existing is None:
                    publication_obj = publication.objects.create(
                        id=next_sequence_value("publication_seq"),
                        pubmedid=pmid,
                        **defaults
                    )
                    imported_count += 1
                else:
                    for field, value in defaults.items():
                        setattr(existing, field, value)
                    existing.save(update_fields=list(defaults.keys()))
                    publication_obj = existing
                    updated_count += 1

                publication_program_link.objects.get_or_create(
                    publicationid=publication_obj.id,
                    programid=2,
                )

        logger.info(
            "Successfully imported %s publications and updated %s publications from cancerdataexpo rdf.",
            imported_count,
            updated_count,
        )
