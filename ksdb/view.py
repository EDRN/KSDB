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
    for i in range(0,len(frame)):
        objid = frame[i][0]
        frame[i].insert(0, "<input type='checkbox' name='"+objtype+"' id='"+str(frame[i][0])+"'>")
        for j in range(1, len(frame[i])):
            #ignore unicode characters
            if isinstance(frame[i][j], basestring):
                frame[i][j] = frame[i][j].encode('ascii', 'ignore')
            frame[i][j] = "<a href='"+_KSDBhref+objtype+"input/?id="+str(objid)+"'>"+str(frame[i][j])+"</a>"

    return frame

@login_required(login_url="/login/")
def view_service(request):
    personheaders = ["Select","Person ID", "First Name", "Last Name", "Phone"]
    persontable = [ [obj.id,obj.firstname, obj.lastname, obj.telephone] for obj in list(person.objects.all()) ]
    protocolheaders = ["Select","Protocol ID", "Title", "Short Name"]
    protocoltable = [ [obj.id,obj.title, obj.shortname] for obj in list(protocol.objects.all()) ]
    publicationheaders = ["Select","Publication ID", "Title", "Author", "Pubmed ID"]
    publicationtable = [ [obj.id,obj.title, obj.authors, obj.pubmedid] for obj in list(publication.objects.all()) ]
    fundedsiteheaders = ["Select","Part. Site ID", "PIs", "Status", "Description"]
    fundedsitetable = [ [obj.id,obj.pis, obj.status, obj.description] for obj in list(fundedsite.objects.all()) ]
    institutionheaders = ["Select","Institution ID", "Name", "Abbreviation"]
    institutiontable = [ [obj.id,obj.name, obj.abbreviation] for obj in list(institution.objects.all()) ]
    projectheaders = ["Select","Project ID", "Title", "Abbreviation"]
    projecttable = [ [obj.id,obj.title, obj.abbreviation] for obj in list(project.objects.all()) ]

    organheaders = ["Select","Organ ID", "Name"]
    organtable = [ [obj.id,obj.name] for obj in list(organ.objects.all()) ]

    degreeheaders = ["Select","Degree ID", "Title"]
    degreetable = [ [obj.id, obj.title] for obj in list(degree.objects.all()) ]

    persontable = setupTable(persontable, "person")
    protocoltable = setupTable(protocoltable, "protocol")
    publicationtable = setupTable(publicationtable, "publication")
    fundedsitetable = setupTable(fundedsitetable, "fundedsite")
    institutiontable = setupTable(institutiontable, "institution")
    projecttable = setupTable(projecttable, "project")
    organtable = setupTable(organtable, "organ")
    degreetable = setupTable(degreetable, "degree")


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

