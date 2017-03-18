# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import species

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import SpeciesForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_species_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        speciesid = request.GET.get('id')
        if speciesid:
            obj = species.objects.get(pk=int(speciesid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : escapejs(obj.description),
                    "title" : obj.title,
                   }
    return data

def delete_species(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for org_id in ids:
                #delete species itself
                species.objects.filter(id=org_id).delete()

            message = "Successfully deleted species id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No speciess selected, please select species for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def species_input(request):
    if request.method == 'POST':

        org_id = None
        message = "You have successfully added a species."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            org_id = int(request.POST.get('speciesid'))
            message = "You have successfull edited species "+str(org_id)+"."
            parameters["id"] = org_id
            speciesi = species.objects.get(id=org_id)
            speciesm = SpeciesForm(parameters or None, instance=speciesi)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    species.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This species title name has already been registered."]}'})
                except species.DoesNotExist:
                    pass
                except species.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This species name has already been registered."]}'})
            org_id = IdSeq.objects.raw("select sequence_name, nextval('species_seq') from species_seq")[0].nextval
            parameters["id"] = org_id
            speciesm = SpeciesForm(parameters)
        
        if speciesm.is_valid():
            speciesm.save()
        else:
            message = simplejson.dumps(speciesm.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate species data from db
    data = gen_species_data(request)
    
    # Render input page with the documents and the form
    return render_to_response(
        'speciesinput.html',
        data,
        context_instance=RequestContext(request)
    )
