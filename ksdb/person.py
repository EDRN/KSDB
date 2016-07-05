# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import person

# Allow external command processing
from django.http import JsonResponse

#import settings
import logging
logger = logging.getLogger(__name__)

def person_input(request):
    if request.method == 'POST':
        first = request.POST.get('personfirst')
        last = request.POST.get('personlast')
        degree = request.POST.get('persondegree')
        email = request.POST.get('personemail')
        phone = request.POST.get('personphone')
        
        per_id = None
        message = "You have successfully added a person."
        if request.POST.get('action') == "edit":
            per_id = int(request.POST.get('personid'))
            message = "You have successfull edited person "+str(per_id)+"."
        else:
            per_id = IdSeq.objects.raw("select sequence_name, nextval('person_seq') from person_seq")[0].nextval
        
        personm = person(id = per_id, 
                            firstname = first, 
                            lastname = last, 
                            degrees = degree, 
                            email = email, 
                            telephone = phone, 
                    )
        personm.save()

        return JsonResponse({'Success':"True",
                             'errors':'',
                            'Message':message})

    data = {"action" : "New" }
    if request.method == 'GET':
        personid = request.GET.get('id')
        if personid:
            obj = person.objects.get(pk=int(personid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "personfirst" : obj.firstname,
                    "personlast" : obj.lastname,
                    "persondegree" : obj.degrees,
                    "personemail" : obj.email,
                    "personphone" : obj.telephone,
                   }
            print data
    # Render input page with the documents and the form
    return render_to_response(
        'personinput.html',
        data,
        context_instance=RequestContext(request)
    )
