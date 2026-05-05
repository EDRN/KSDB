from django.core.management.base import BaseCommand
from django.db import transaction
from rdflib.term import URIRef

from ksdb.models import degree, person, person_degree_link
from ksdb.rdf_ingest_utils import fetch_rdf_graph, next_sequence_value, parse_statements, text_value

import logging


logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Ingest registered people from the EDRN RDF feed."
    personurl = "https://edrn.jpl.nasa.gov/cancerdataexpo/rdf-data/registered-person/@@rdf"
    _firstname_uri = URIRef("http://xmlns.com/foaf/0.1/givenname")
    _lastname_uri = URIRef("http://xmlns.com/foaf/0.1/surname")
    _phone_uri = URIRef("http://xmlns.com/foaf/0.1/phone")
    _mbox_uri = URIRef("http://xmlns.com/foaf/0.1/mbox")
    _degree_uris = (
        URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#degree1"),
        URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#degree2"),
        URIRef("http://edrn.nci.nih.gov/rdf/schema.rdf#degree3"),
    )

    def handle(self, *args, **options):
        graph = fetch_rdf_graph(self.personurl)
        statements = parse_statements(graph)
        imported_count = 0
        updated_count = 0

        with transaction.atomic():
            for subject in statements:
                firstname = text_value(statements[subject].get(self._firstname_uri, [""])[0])
                lastname = text_value(statements[subject].get(self._lastname_uri, [""])[0])
                email = text_value(statements[subject].get(self._mbox_uri, [""])[0]).replace("mailto:", "")
                telephone = text_value(statements[subject].get(self._phone_uri, [""])[0]).replace("tel:", "")

                if not (firstname and lastname and email):
                    continue

                person_obj = person.objects.filter(firstname=firstname, lastname=lastname).first()
                if person_obj is None and email:
                    person_obj = person.objects.filter(email=email).first()

                if person_obj is None:
                    person_obj = person.objects.create(
                        id=next_sequence_value("person_seq"),
                        firstname=firstname,
                        lastname=lastname,
                        email=email,
                        telephone=telephone or None,
                        extension=None,
                        description="",
                        degrees=None,
                        dcp=False,
                        dcb=False,
                    )
                    imported_count += 1
                else:
                    person_obj.firstname = firstname
                    person_obj.lastname = lastname
                    person_obj.email = email
                    if telephone:
                        person_obj.telephone = telephone
                    if person_obj.description is None:
                        person_obj.description = ""
                    if person_obj.dcp is None:
                        person_obj.dcp = False
                    if person_obj.dcb is None:
                        person_obj.dcb = False
                    person_obj.save()
                    updated_count += 1

                for degree_uri in self._degree_uris:
                    degree_title = text_value(statements[subject].get(degree_uri, [""])[0])
                    if not degree_title:
                        continue
                    degree_obj = degree.objects.filter(title=degree_title).first()
                    if degree_obj is None:
                        degree_obj = degree.objects.create(
                            id=next_sequence_value("degree_seq"),
                            title=degree_title,
                            description="",
                        )
                    person_degree_link.objects.get_or_create(
                        personid=person_obj.id,
                        degreeid=degree_obj.id,
                    )

        logger.info(
            "Successfully imported %s persons and updated %s persons from cancerdataexpo rdf into KSDB.",
            imported_count,
            updated_count,
        )
