# protocols.py
from django.shortcuts import render
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import protocol, organ, organ_protocol_link, person, pi_protocol_link, project, institution, fundedsite, publication

#import settings
from django.conf import settings
import logging
logger = logging.getLogger(__name__)

def view_service(request):
    personheaders = ["Person ID", "First Name", "Last Name", "Phone"]
    persontable = [ ["<a href='/ksdb/personinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.firstname, obj.lastname, obj.telephone] for obj in list(person.objects.all()) ]
    protocolheaders = ["Protocol ID", "Title", "Description"]
    protocoltable = [ ["<a href='/ksdb/protocolinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.description] for obj in list(protocol.objects.all()) ]
    publicationheaders = ["Publication ID", "Title", "Author", "Pubmed ID"]
    publicationtable = [ ["<a href='/ksdb/publicationinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.authors, obj.pubmedid] for obj in list(publication.objects.all()) ]
    fundedsiteheaders = ["Funded Site ID", "Title", "Description"]
    fundedsitetable = [ ["<a href='/ksdb/fundedsiteinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.description] for obj in list(fundedsite.objects.all()) ]
    institutionheaders = ["Institution ID", "Name", "Abbreviation"]
    institutiontable = [ ["<a href='/ksdb/institutioninput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.name, obj.abbreviation] for obj in list(institution.objects.all()) ]
    projectheaders = ["Project ID", "Title", "Abbreviation"]
    projecttable = [ ["<a href='/ksdb/projectinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.abbreviation] for obj in list(project.objects.all()) ]

    # Render input page with the documents and the form
    return render(
        request, 'ksdb.html',
        {   'success':True,
            'protocolheaders': protocolheaders,
            'protocoltable': protocoltable,
            'personheaders': personheaders,
            'persontable': persontable,
            'publicationheaders': publicationheaders,
            'publicationtable': publicationtable,
            'fundedsiteheaders': fundedsiteheaders,
            'fundedsitetable': fundedsitetable,
            'institutionheaders': institutionheaders,
            'institutiontable': institutiontable,
            'projectheaders': projectheaders,
            'projecttable': projecttable
        }
    )

