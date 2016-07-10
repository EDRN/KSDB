# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import project

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
        else:
            message = simplejson.dumps(projectm.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})


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
    # Render input page with the documents and the form
    return render_to_response(
        'projectinput.html',
        data,
        context_instance=RequestContext(request)
    )
