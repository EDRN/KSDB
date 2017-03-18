# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import discipline

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import DisciplineForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_discipline_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        disciplineid = request.GET.get('id')
        if disciplineid:
            obj = discipline.objects.get(pk=int(disciplineid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : escapejs(obj.description),
                    "title" : obj.title,
                   }
    return data

def delete_discipline(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for org_id in ids:
                #delete discipline itself
                discipline.objects.filter(id=org_id).delete()

            message = "Successfully deleted discipline id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No disciplines selected, please select discipline for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def discipline_input(request):
    if request.method == 'POST':

        org_id = None
        message = "You have successfully added a discipline."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            org_id = int(request.POST.get('disciplineid'))
            message = "You have successfull edited discipline "+str(org_id)+"."
            parameters["id"] = org_id
            disciplinei = discipline.objects.get(id=org_id)
            disciplinem = DisciplineForm(parameters or None, instance=disciplinei)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    discipline.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This discipline title name has already been registered."]}'})
                except discipline.DoesNotExist:
                    pass
                except discipline.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This discipline name has already been registered."]}'})
            org_id = IdSeq.objects.raw("select sequence_name, nextval('discipline_seq') from discipline_seq")[0].nextval
            parameters["id"] = org_id
            disciplinem = DisciplineForm(parameters)
        
        if disciplinem.is_valid():
            disciplinem.save()
        else:
            message = simplejson.dumps(disciplinem.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate discipline data from db
    data = gen_discipline_data(request)
    
    # Render input page with the documents and the form
    return render_to_response(
        'disciplineinput.html',
        data,
        context_instance=RequestContext(request)
    )
