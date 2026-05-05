from datetime import datetime

import requests
import rdflib
from django.db import connection
from django.utils.timezone import make_aware, utc

from ksdb.models import program


def fetch_rdf_graph(url, timeout=120):
    response = requests.get(url, timeout=timeout)
    response.raise_for_status()
    graph = rdflib.Graph()
    graph.parse(data=response.text, format="xml")
    return graph


def parse_statements(graph):
    statements = {}
    for subject, predicate, obj in graph:
        predicates = statements.setdefault(subject, {})
        predicates.setdefault(predicate, []).append(obj)
    return statements


def text_value(value):
    if value is None:
        return ""
    return " ".join(str(value).strip().split())


def next_sequence_value(sequence_name):
    with connection.cursor() as cursor:
        cursor.execute("select nextval(%s)", [sequence_name])
        return cursor.fetchone()[0]


def parse_protocol_datetime(value):
    cleaned = text_value(value)
    if not cleaned:
        return None
    for fmt in ("%b %d %Y %I:%M%p", "%b %d %Y %I:%M %p"):
        try:
            parsed = datetime.strptime(cleaned, fmt)
            return make_aware(parsed, utc)
        except ValueError:
            continue
    return None


def ensure_default_programs():
    program.objects.update_or_create(
        id=1,
        defaults={
            "title": "MCL",
            "abbreviation": "MCL",
            "description": "Seeded default program for local KSDB bootstrap.",
        },
    )
    program.objects.update_or_create(
        id=2,
        defaults={
            "title": "EDRN",
            "abbreviation": "EDRN",
            "description": "Seeded default program for EDRN RDF imports.",
        },
    )
