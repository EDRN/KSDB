# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import copy, simplejson

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import degree, person_degree_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import DegreeForm

#import settings
import logging
logger = logging.getLogger(__name__)

def gen_degree_data(request):
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
    return data

def delete_degree(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for deg_id in ids:
                #delete person degree associations
                person_degree_link.objects.filter(degreeid=deg_id).delete()
                #delete degree itself
                degree.objects.filter(id=deg_id).delete()

            message = "Successfully deleted degree id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No degrees selected, please select degree for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

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
            if (request.POST.get('duplicate') == 'false'):
                try:
                    degree.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This degree has already been registered."]}'})
                except degree.DoesNotExist:
                    pass
                except degree.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["This degree has already been registered."]}'})
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

    #generate degree data from db
    data = gen_degree_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'degreeinput.html',
        data,
        context_instance=RequestContext(request)
    )
