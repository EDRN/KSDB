# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import disease, disease_protocol_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import DiseaseForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_disease_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        diseaseid = request.GET.get('id')
        if diseaseid:
            obj = disease.objects.get(pk=int(diseaseid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : obj.description,
                    "icd10" : obj.icd10,
                   }
    return data

def delete_disease(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for org_id in ids:
                #delete protocol disease associations
                disease_protocol_link.objects.filter(diseaseid=org_id).delete()
                #delete disease itself
                disease.objects.filter(id=org_id).delete()

            message = "Successfully deleted disease id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No diseases selected, please select disease for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def disease_input(request):
    if request.method == 'POST':

        org_id = None
        message = "You have successfully added a disease."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            org_id = int(request.POST.get('diseaseid'))
            message = "You have successfull edited disease "+str(org_id)+"."
            parameters["id"] = org_id
            diseasei = disease.objects.get(id=org_id)
            diseasem = DiseaseForm(parameters or None, instance=diseasei)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    disease.objects.get(icd10=parameters['icd10'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"icd10":["This disease icd10 name has already been registered."]}'})
                except disease.DoesNotExist:
                    pass
                except disease.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"icd10":["This disease name has already been registered."]}'})
            org_id = IdSeq.objects.raw("select sequence_name, nextval('disease_seq') from disease_seq")[0].nextval
            parameters["id"] = org_id
            diseasem = DiseaseForm(parameters)
        
        if diseasem.is_valid():
            diseasem.save()
        else:
            message = simplejson.dumps(diseasem.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate disease data from db
    data = gen_disease_data(request)
    
    # Render input page with the documents and the form
    return render_to_response(
        'diseaseinput.html',
        data,
        context_instance=RequestContext(request)
    )
