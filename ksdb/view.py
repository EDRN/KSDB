# protocols.py
from django.shortcuts import render
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import protocol, organ, organ_protocol_link, person, pi_protocol_link, project, institution, fundedsite, publication, degree

#import settings
from django.conf import settings
import logging
logger = logging.getLogger(__name__)

def view_service(request):
    personheaders = ["Select","Person ID", "First Name", "Last Name", "Phone"]
    persontable = [ ["<input type='checkbox' name='person' id='"+str(obj.id)+"'>","<a href='/ksdb/personinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.firstname, obj.lastname, obj.telephone] for obj in list(person.objects.all()) ]
    protocolheaders = ["Select","Protocol ID", "Title", "Description"]
    protocoltable = [ ["<input type='checkbox' name='protocol' id='"+str(obj.id)+"'>","<a href='/ksdb/protocolinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.description] for obj in list(protocol.objects.all()) ]
    publicationheaders = ["Select","Publication ID", "Title", "Author", "Pubmed ID"]
    publicationtable = [ ["<input type='checkbox' name='publication' id='"+str(obj.id)+"'>","<a href='/ksdb/publicationinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.authors, obj.pubmedid] for obj in list(publication.objects.all()) ]
    fundedsiteheaders = ["Select","Funded Site ID", "Institutions", "Description"]
    fundedsitetable = [ ["<input type='checkbox' name='fundedsite' id='"+str(obj.id)+"'>","<a href='/ksdb/fundedsiteinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.institutions, obj.description] for obj in list(fundedsite.objects.all()) ]
    institutionheaders = ["Select","Institution ID", "Name", "Abbreviation"]
    institutiontable = [ ["<input type='checkbox' name='institution' id='"+str(obj.id)+"'>","<a href='/ksdb/institutioninput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.name, obj.abbreviation] for obj in list(institution.objects.all()) ]
    projectheaders = ["Select","Project ID", "Title", "Abbreviation"]
    projecttable = [ ["<input type='checkbox' name='project' id='"+str(obj.id)+"'>","<a href='/ksdb/projectinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title, obj.abbreviation] for obj in list(project.objects.all()) ]

    organheaders = ["Select","Organ ID", "Name"]
    organtable = [ ["<input type='checkbox' name='organ' id='"+str(obj.id)+"'>","<a href='/ksdb/organinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.name] for obj in list(organ.objects.all()) ]

    degreeheaders = ["Select","Degree ID", "Title"]
    degreetable = [ ["<input type='checkbox' name='degree' id='"+str(obj.id)+"'>","<a href='/ksdb/degreeinput/?id="+str(obj.id)+"'>"+str(obj.id)+"</a>", obj.title] for obj in list(degree.objects.all()) ]

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
            'projecttable': projecttable,
            'organheaders': organheaders,
            'organtable': organtable,
            'degreeheaders': degreeheaders,
            'degreetable': degreetable
        }
    )

