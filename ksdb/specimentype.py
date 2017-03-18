# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import specimentype, specimentype_organ_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import SpecimenTypeForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_specimentype_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        specimentypeid = request.GET.get('id')
        if specimentypeid:
            obj = specimentype.objects.get(pk=int(specimentypeid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : escapejs(obj.description),
                    "title" : obj.title,
                   }
    return data

def delete_specimentype(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for org_id in ids:
                #delete protocol specimentype associations
                specimentype_organ_link.objects.filter(specimentypeid=org_id).delete()
                #delete specimentype itself
                specimentype.objects.filter(id=org_id).delete()

            message = "Successfully deleted specimentype id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No specimentypes selected, please select specimentype for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def specimentype_input(request):
    if request.method == 'POST':

        org_id = None
        message = "You have successfully added a specimentype."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            org_id = int(request.POST.get('specimentypeid'))
            message = "You have successfull edited specimentype "+str(org_id)+"."
            parameters["id"] = org_id
            specimentypei = specimentype.objects.get(id=org_id)
            specimentypem = SpecimenTypeForm(parameters or None, instance=specimentypei)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    specimentype.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This specimentype title name has already been registered."]}'})
                except specimentype.DoesNotExist:
                    pass
                except specimentype.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This specimentype name has already been registered."]}'})
            org_id = IdSeq.objects.raw("select sequence_name, nextval('specimentype_seq') from specimentype_seq")[0].nextval
            parameters["id"] = org_id
            specimentypem = SpecimenTypeForm(parameters)
        
        if specimentypem.is_valid():
            specimentypem.save()
        else:
            message = simplejson.dumps(specimentypem.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate specimentype data from db
    data = gen_specimentype_data(request)
    
    # Render input page with the documents and the form
    return render_to_response(
        'specimentypeinput.html',
        data,
        context_instance=RequestContext(request)
    )
