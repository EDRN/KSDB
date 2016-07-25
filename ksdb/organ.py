# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import organ, organ_protocol_link, fundedsite_organ_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import OrganForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_organ_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        organid = request.GET.get('id')
        if organid:
            obj = organ.objects.get(pk=int(organid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "name" : obj.name,
                    "description" : obj.description,
                   }
    return data

def delete_organ(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for org_id in ids:
                #delete protocol organ associations
                organ_protocol_link.objects.filter(organid=org_id).delete()
                #delete organ fundedsite associations
                fundedsite_organ_link.objects.filter(organid=org_id).delete()
                #delete organ itself
                organ.objects.filter(id=org_id).delete()

            message = "Successfully deleted organ id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No organs selected, please select organ for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def organ_input(request):
    if request.method == 'POST':

        org_id = None
        message = "You have successfully added a organ."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            org_id = int(request.POST.get('organid'))
            message = "You have successfull edited organ "+str(org_id)+"."
            parameters["id"] = org_id
            organi = organ.objects.get(id=org_id)
            organm = OrganForm(parameters or None, instance=organi)
        else:
            org_id = IdSeq.objects.raw("select sequence_name, nextval('organ_seq') from organ_seq")[0].nextval
            parameters["id"] = org_id
            organm = OrganForm(parameters)
        
        if organm.is_valid():
            organm.save()
        else:
            message = simplejson.dumps(organm.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate organ data from db
    data = gen_organ_data(request)
    
    # Render input page with the documents and the form
    return render_to_response(
        'organinput.html',
        data,
        context_instance=RequestContext(request)
    )
