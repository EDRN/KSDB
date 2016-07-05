# persons.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import person

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import PersonForm

#import settings
import logging
logger = logging.getLogger(__name__)

def person_input(request):
    if request.method == 'POST':
        
        per_id = None
        message = "You have successfully added a person."
        success = True
        parameters = copy.copy(request.POST)
        if request.POST.get('action') == "edit":
            per_id = int(request.POST.get('personid'))
            message = "You have successfull edited person "+str(per_id)+"."
            parameters["id"] = per_id
            personi = person.objects.get(id=per_id)
            personm = PersonForm(parameters or None, instance=personi)
        else:
            per_id = IdSeq.objects.raw("select sequence_name, nextval('person_seq') from person_seq")[0].nextval
            parameters["id"] = per_id
            personm = PersonForm(parameters)
        

        if personm.is_valid():
            personm.save()
        else:
            message = simplejson.dumps(personm.errors)
            success = False

        return JsonResponse({'Success':success,
                            'Message':message})

    data = {"action" : "New" }
    if request.method == 'GET':
        personid = request.GET.get('id')
        if personid:
            obj = person.objects.get(pk=int(personid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "firstname" : obj.firstname,
                    "lastname" : obj.lastname,
                    "degrees" : obj.degrees,
                    "email" : obj.email,
                    "telephone" : obj.telephone,
                   }
            print data
    # Render input page with the documents and the form
    return render_to_response(
        'personinput.html',
        data,
        context_instance=RequestContext(request)
    )
