# institution.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import institution, institution_personnel_link, person

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

            #delete and save new person institution associations
            personnel = request.POST.getlist('personnel')
            institution_personnel_link.objects.filter(institutionid=ins_id).delete()
            for per in personnel:
                institution_personnel_linkm = institution_personnel_link(institutionid = ins_id, personid = per)
                institution_personnel_linkm.save()

        else:
            message = simplejson.dumps(institutionm.errors)
            success = False
        return JsonResponse({'Success':success,
                            'Message':message})

    personfield = [ [str(obj.id), str(obj.firstname), str(obj.lastname)] for obj in list(person.objects.all()) ]
    data = {"action" : "New" ,
            "personnel" : personfield,
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
                    "person_link_id": [ ipl.personid for ipl in list(institution_personnel_link.objects.filter(institutionid=int(institutionid))) ],
                    "personnel" : personfield,
                    "description" : obj.description,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'institutioninput.html',
        data,
        context_instance=RequestContext(request)
    )
