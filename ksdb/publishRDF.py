# publishRDF.py
from django.http import HttpResponse
from django.core.management import call_command
from StringIO import StringIO

#import settings
import logging
import json
logger = logging.getLogger(__name__)

def publishrdf(request):
    if request.method == 'GET':
        rdftype = request.GET.get('rdftype')
        
        rdf = StringIO()
        call_command('publishrdfs', rdftype, stdout=rdf)
        rdf_resp = rdf.getvalue()

        return HttpResponse(rdf_resp, content_type='text/xml')
