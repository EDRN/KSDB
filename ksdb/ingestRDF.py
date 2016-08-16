# ingestRDF.py
from django.http import HttpResponse
from django.core.management import call_command
from StringIO import StringIO
from sys import stdout, stderr

#import settings
import logging
import json
logger = logging.getLogger(__name__)

def ingestrdf(request):
    if request.method == 'GET':
        rdftype = request.GET.get('rdftype')
        if rdftype == "publication":
            call_command('ingestpublications')
        elif rdftype == "organ":
            call_command('ingestorgans')
        elif rdftype == "person":
            call_command('ingestpersons')

        return HttpResponse({"Success":True}, content_type='json')
