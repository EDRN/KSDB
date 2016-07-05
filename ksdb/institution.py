# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import institution

# Allow external command processing
from django.http import JsonResponse

#import settings
import logging
logger = logging.getLogger(__name__)

def institution_input(request):
    if request.method == 'POST':
        name= request.POST.get('institutionname')
        department = request.POST.get('institutiondept')
        abbreviation = request.POST.get('institutionabbr')
        url = request.POST.get('institutionurl')
        description = request.POST.get('institutiondesc')

        ins_id = None
        message = "You have successfully added a institution."
        if request.POST.get('action') == "edit":
            ins_id = int(request.POST.get('institutionid'))
            message = "You have successfull edited institution "+str(ins_id)+"."
        else:
            ins_id = IdSeq.objects.raw("select sequence_name, nextval('institution_seq') from institution_seq")[0].nextval
        
        institutionm = institution(id = ins_id, 
                            name = name, 
                            department = department, 
                            abbreviation = abbreviation, 
                            url = url, 
                            description = description, 
                    )
        institutionm.save()

        return JsonResponse({'Success':"True",
                             'errors':'',
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
