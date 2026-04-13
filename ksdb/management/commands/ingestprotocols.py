from django.core.management.base import BaseCommand
from rdflib.term import URIRef

from ksdb.models import protocol, protocol_program_link
from ksdb.rdf_ingest_utils import (
    ensure_default_programs,
    fetch_rdf_graph,
    next_sequence_value,
    parse_protocol_datetime,
    parse_statements,
    text_value,
)

import logging


logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Ingest protocols from the EDRN RDF feed."
    protocolurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/protocols/@@rdf"
    _rdf_type = URIRef("http://www.w3.org/1999/02/22-rdf-syntax-ns#type")
    _protocol_type_uri = URIRef("http://edrn.nci.nih.gov/rdf/types.rdf#Protocol")
    _aims_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#aims")
    _abstract_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#objective")
    _finish_date_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#estimatedFinishDate")
    _start_date_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#startDate")
    _ab_name_uri = URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#abbreviatedName")
    _author_uri = URIRef("http://purl.org/dc/terms/author")
    _title_uri = URIRef("http://purl.org/dc/terms/title")

    def handle(self, *args, **options):
        ensure_default_programs()
        graph = fetch_rdf_graph(self.protocolurl)
        statements = parse_statements(graph)
        imported_count = 0
        updated_count = 0

        for subject in statements:
            if self._protocol_type_uri not in statements[subject].get(self._rdf_type, []):
                continue

            title = text_value(statements[subject].get(self._title_uri, [""])[0])
            if not title:
                continue

            edrn_id = text_value(subject)
            aims = text_value(statements[subject].get(self._aims_uri, [""])[0])
            abstract = text_value(statements[subject].get(self._abstract_uri, [""])[0])
            shortname = text_value(statements[subject].get(self._ab_name_uri, [""])[0])
            author = text_value(statements[subject].get(self._author_uri, [""])[0])
            end_date = parse_protocol_datetime(statements[subject].get(self._finish_date_uri, [""])[0])
            start_date = parse_protocol_datetime(statements[subject].get(self._start_date_uri, [""])[0])

            defaults = {
                "title": title,
                "edrn_id": edrn_id,
                "shortname": shortname or None,
                "organs": "",
                "fundedsites": "",
                "institutions": "",
                "programs": "2",
                "pis": author or "",
                "cis": "",
                "start_date": start_date,
                "end_date": end_date,
                "site_contact": None,
                "site_contact_email": None,
                "irb_approval": None,
                "irb_approval_num": None,
                "irb_contact": None,
                "irb_contact_email": None,
                "hum_sub_train": None,
                "abstract": abstract or "",
                "aims": aims or "",
                "publications": "",
                "data_custodians": "",
            }

            protocol_obj = protocol.objects.filter(edrn_id=edrn_id).first()
            if protocol_obj is None:
                protocol_obj = protocol.objects.filter(title=title).first()

            if protocol_obj is None:
                protocol_obj = protocol.objects.create(
                    id=next_sequence_value("protocol_seq"),
                    **defaults
                )
                imported_count += 1
            else:
                for field, value in defaults.items():
                    setattr(protocol_obj, field, value)
                protocol_obj.save()
                updated_count += 1

            protocol_program_link.objects.get_or_create(
                protocolid=protocol_obj.id,
                programid=2,
            )

        logger.info(
            "Successfully imported %s protocols and updated %s protocols from cancerdataexpo rdf.",
            imported_count,
            updated_count,
        )
