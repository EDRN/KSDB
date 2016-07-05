# institution.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import institution

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import InstitutionForm

#import settings
import logging
logger = logging.getLogger(__name__)

def institution_input(request):
    if request.method == 'POST':

        ins_id = None
        message = "You have successfully added a institution."
        success = True
        parameters = copy.copy(request.POST)
        if request.POST.get('action') == "edit":
            ins_id = int(request.POST.get('institutionid'))
            message = "You have successfull edited institution "+str(ins_id)+"."
            parameters["id"] = ins_id
            institutioni = institution.objects.get(id=ins_id)
            institutionm = InstitutionForm(parameters or None, instance=institutioni)
        else:
            ins_id = IdSeq.objects.raw("select sequence_name, nextval('institution_seq') from institution_seq")[0].nextval
            parameters["id"] = ins_id
            institutionm = InstitutionForm(parameters)
        
        if institutionm.is_valid():
            institutionm.save()
        else:
            message = simplejson.dumps(institutionm.errors)
            success = False
        return JsonResponse({'Success':success,
                            'Message':message})
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        institutionid = request.GET.get('id')
        if institutionid:
            obj = institution.objects.get(pk=int(institutionid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "name" : obj.name,
                    "department" : obj.department,
                    "abbreviation" : obj.abbreviation,
                    "url" : obj.url,
                    "description" : obj.description,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'institutioninput.html',
        data,
        context_instance=RequestContext(request)
    )
