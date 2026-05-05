# protocols.py
from django.db import connection, transaction
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import labcas_assaytype

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import LabcasAssayTypeForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_assaytype_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        assaytypeid = request.GET.get('id')
        if assaytypeid:
            obj = labcas_assaytype.objects.get(pk=int(assaytypeid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "name" : obj.name,
                    "alias" : obj.alias,
                   }
    return data

def delete_assaytype(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for assaytype_id in ids:
                #delete assaytype itself
                labcas_assaytype.objects.filter(id=assaytype_id).delete()

            message = "Successfully deleted assaytype id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No assaytypes selected, please select assaytype for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def assaytype_input(request):
    if request.method == 'POST':

        assaytype_id = None
        message = "You have successfully added a assaytype."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            assaytype_id = int(request.POST.get('assaytypeid'))
            message = "You have successfull edited assaytype "+str(assaytype_id)+"."
            parameters["id"] = assaytype_id
            assaytypei = labcas_assaytype.objects.get(id=assaytype_id)
            assaytypem = LabcasAssayTypeForm(parameters or None, instance=assaytypei)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    labcas_assaytype.objects.get(name=parameters['name'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"name":["This assaytype name has already been registered."]}'})
                except labcas_assaytype.DoesNotExist:
                    pass
                except labcas_assaytype.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"name":["This assaytype name has already been registered."]}'})
            cursor = connection.cursor()

            result = cursor.execute("select nextval('labcas_assaytype_seq') from labcas_assaytype_seq")
            assaytype_id = cursor.fetchone()[0]
            #assaytype_id = IdSeq.objects.raw("select sequence_name, nextval('assaytype_seq') from assaytype_seq")[0].nextval
            parameters["id"] = assaytype_id
            assaytypem = LabcasAssayTypeForm(parameters)
        
        if assaytypem.is_valid():
            assaytypem.save()
        else:
            message = simplejson.dumps(assaytypem.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate assaytype data from db
    data = gen_assaytype_data(request)
    
    # Render input page with the documents and the form
    return render_to_response(
        'assaytypeinput.html',
        data,
        context_instance=RequestContext(request)
    )
