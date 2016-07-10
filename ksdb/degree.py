# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import degree

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import DegreeForm

#import settings
import logging
logger = logging.getLogger(__name__)

def degree_input(request):
    if request.method == 'POST':

        org_id = None
        message = "You have successfully added a degree."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            org_id = int(request.POST.get('degreeid'))
            message = "You have successfull edited degree "+str(org_id)+"."
            parameters["id"] = org_id
            degreei = degree.objects.get(id=org_id)
            degreem = DegreeForm(parameters or None, instance=degreei)
        else:
            org_id = IdSeq.objects.raw("select sequence_name, nextval('degree_seq') from degree_seq")[0].nextval
            parameters["id"] = org_id
            degreem = DegreeForm(parameters)
        
        if degreem.is_valid():
            degreem.save()
        else:
            message = simplejson.dumps(degreem.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})


    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        degreeid = request.GET.get('id')
        if degreeid:
            obj = degree.objects.get(pk=int(degreeid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "title" : obj.title,
                    "description" : obj.description,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'degreeinput.html',
        data,
        context_instance=RequestContext(request)
    )
