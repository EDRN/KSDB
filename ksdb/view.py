# protocols.py
from django.shortcuts import render
from django.template import RequestContext
from django.contrib.auth.decorators import login_required
import requests

# Create your views here.
from ksdb.models import protocol, organ, organ_protocol_link, person, pi_protocol_link, project, institution, fundedsite, publication, degree

#import settings
from django.conf import settings
import logging
logger = logging.getLogger(__name__)

def setupTable(frame, objtype):
    _KSDBhref = "/ksdb/"
    newframe = []
    for i in range(0,len(frame)):
        frameline = list(frame[i])
        objid = frameline[0]
        frameline.insert(0, "<input type='checkbox' name='"+objtype+"' id='"+str(frameline[0])+"'>")
        for j in range(1, len(frameline)):
            #ignore unicode characters
            if isinstance(frameline[j], basestring):
                frameline[j] = frameline[j].encode('ascii', 'ignore')
            frameline[j] = "<a href='"+_KSDBhref+objtype+"input/?id="+str(objid)+"'>"+str(frameline[j])+"</a>"
        newframe.append(frameline)
    return newframe

@login_required(login_url="/ksdb/login/")
def view_service(request):
    personheaders = ["Select","Person ID", "First Name", "Last Name", "Phone", "Email"]
    protocolheaders = ["Select","Protocol ID", "Title", "Short Name"]
    publicationheaders = ["Select","Publication ID", "Title", "Author", "Pubmed ID", "Year"]
    fundedsiteheaders = ["Select","Part. Site ID", "PIs", "Status", "Description"]
    institutionheaders = ["Select","Institution ID", "Name", "Abbreviation"]
    projectheaders = ["Select","Project ID", "Title", "Abbreviation"]
    organheaders = ["Select","Organ ID", "Name"]
    degreeheaders = ["Select","Degree ID", "Title"]

    # Render input page with the documents and the form
    return render(
        request, 'ksdb.html',
        {   'success':True,
            'protocolheaders': protocolheaders,
            'personheaders': personheaders,
            'publicationheaders': publicationheaders,
            'fundedsiteheaders': fundedsiteheaders,
            'institutionheaders': institutionheaders,
            'projectheaders': projectheaders,
            'organheaders': organheaders,
            'degreeheaders': degreeheaders,
        }
    )

