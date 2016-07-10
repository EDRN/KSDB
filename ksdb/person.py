# persons.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import person, person_degree_link, degree

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

            #delete and save new person degree associations
            degrees = request.POST.getlist('degrees')
            person_degree_link.objects.filter(personid=per_id).delete()
            for deg in degrees:
                person_degree_linkm = person_degree_link(personid = per_id, degreeid = deg)
                person_degree_linkm.save()

        else:
            message = simplejson.dumps(personm.errors)
            success = False

        return JsonResponse({'Success':success,
                            'Message':message})

    degreefield = [ [str(obj.id), str(obj.title)] for obj in list(degree.objects.all()) ]
    data = {"action" : "New",
            "degrees" : degreefield , }
    if request.method == 'GET':
        personid = request.GET.get('id')
        if personid:
            obj = person.objects.get(pk=int(personid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "firstname" : obj.firstname,
                    "lastname" : obj.lastname,
                    "degree_link_id" : [ pdl.degreeid for pdl in list(person_degree_link.objects.filter(personid=int(personid))) ],
                    "degrees" : degreefield,
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
