# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import project, project_site_link, fundedsite

# Allow external command processing
from django.http import JsonResponse

#import settings
import logging
logger = logging.getLogger(__name__)

def project_input(request):
    if request.method == 'POST':
        title = request.POST.get('projecttitle')
        abbreviation = request.POST.get('projectabbr')
        description = request.POST.get('projectdesc')
        sitelist = request.POST.getlist('projectsites')

        pro_id = None
        message = "You have successfully added a project."
        if request.POST.get('action') == "edit":
            pro_id = int(request.POST.get('projectid'))
            message = "You have successfull edited project "+str(pro_id)+"."
        else:
            pro_id = IdSeq.objects.raw("select sequence_name, nextval('project_seq') from project_seq")[0].nextval
        
        projectm = project(id = pro_id, 
                            title = title, 
                            abbreviation = abbreviation, 
                            description = description, 
                            sites = ",".join(sitelist)
                    )
        projectm.save()

        #delete and save new person protocol associations
        project_site_link.objects.filter(projectid=pro_id).delete()
        for site in sitelist:
            project_site_linkm = project_site_link(projectid = pro_id, fundedsiteid = site)
            project_site_linkm.save()

        return JsonResponse({'Success':"True",
                             'errors':'',
                             'Message':message})
    sitefield = [ [str(obj.id), str(obj.title)] for obj in list(fundedsite.objects.all()) ]
    data = {"action" : "New" ,
            "sites" : sitefield ,
           }
    if request.method == 'GET':
        projectid = request.GET.get('id')
        if projectid:
            obj = project.objects.get(pk=int(projectid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "title" : obj.title,
                    "abbreviation" : obj.abbreviation,
                    "description" : obj.description,
                    "site_link_id" : [ psl.fundedsiteid for psl in list(project_site_link.objects.filter(projectid=int(projectid))) ],
                    "sites" : sitefield,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'projectinput.html',
        data,
        context_instance=RequestContext(request)
    )
