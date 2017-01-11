# publishRDF.py
from django.http import HttpResponse
from django.core.management import call_command
from io import StringIO

#import settings
import logging
import json
logger = logging.getLogger(__name__)

def publishrdf(request):
    if request.method == 'GET':
        rdftype = request.GET.get('rdftype')
        rdf = StringIO()
        call_command('publishrdfs', rdftype, stdout=rdf)
        rdf.seek(0)
        rdf_resp = rdf.read()
        rdf_resp = rdf_resp.strip()
        if rdf_resp.startswith("b'"):
            rdf_resp = rdf_resp[2:]
        if rdf_resp.endswith("'"):
            rdf_resp = rdf_resp[:-1]
        rdf_resp = rdf_resp.replace("\\n", "\n")
        return HttpResponse(rdf_resp.strip(), content_type='application/rdf+xml')
