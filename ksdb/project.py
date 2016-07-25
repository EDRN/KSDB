# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import project, fundedsite_project_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import ProjectForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_project_data(request):
    data = {"action" : "New" ,
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
                   }
    return data

def delete_project(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for pro_id in ids:
                #delete person project associations
                fundedsite_project_link.objects.filter(projectid=pro_id).delete()
                #delete project itself
                project.objects.filter(id=pro_id).delete()

            message = "Successfully deleted project id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No projects selected, please select project for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."

    return JsonResponse({'Success':success,
                                'Message':message})
    
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
        else:
            message = simplejson.dumps(projectm.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate protocol data from db
    data = gen_project_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'projectinput.html',
        data,
        context_instance=RequestContext(request)
    )
