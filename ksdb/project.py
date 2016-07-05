# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import project, project_site_link, fundedsite

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import ProjectForm

#import settings
import logging
logger = logging.getLogger(__name__)

def project_input(request):
    if request.method == 'POST':

        pro_id = None
        message = "You have successfully added a project."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            pro_id = int(request.POST.get('projectid'))
            message = "You have successfull edited project "+str(pro_id)+"."
            parameters["id"] = pro_id
            projecti = project.objects.get(id=pro_id)
            projectm = ProjectForm(parameters or None, instance=projecti)
        else:
            pro_id = IdSeq.objects.raw("select sequence_name, nextval('project_seq') from project_seq")[0].nextval
            parameters["id"] = pro_id
            projectm = ProjectForm(parameters)
        
        if projectm.is_valid():
            projectm.save()
    
            #delete and save new person protocol associations
            sitelist = request.POST.getlist('sites')
            project_site_link.objects.filter(projectid=pro_id).delete()
            for site in sitelist:
                project_site_linkm = project_site_link(projectid = pro_id, fundedsiteid = site)
                project_site_linkm.save()
        else:
            message = simplejson.dumps(projectm.errors)
            success = False
        return JsonResponse({'Success':success,
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
