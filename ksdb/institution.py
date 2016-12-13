# institution.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import institution, institution_personnel_link, person, fundedsite_institution_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import InstitutionForm

#import settings
import logging
logger = logging.getLogger(__name__)

def save_institution_links(ins_id, request):
    #delete and save new person institution associations
    personnel = request.POST.getlist('personnel')
    institution_personnel_link.objects.filter(institutionid=ins_id).delete()
    for per in personnel:
        per_split = per.split(":")
        institution_personnel_linkm = institution_personnel_link(institutionid = ins_id, personid = per_split[0])
        institution_personnel_linkm.save()

def gen_institution_data(request):
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
                    "person_link_id": ",".join([ str(ipl.personid)+":"+person.objects.filter(id=ipl.personid)[0].firstname+" "+person.objects.filter(id=ipl.personid)[0].lastname for ipl in list(institution_personnel_link.objects.filter(institutionid=int(institutionid))) ]),
                    "description" : obj.description,
                   }
    return data

def delete_institution(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for ins_id in ids:
                #delete person institution associations
                institution_personnel_link.objects.filter(institutionid=ins_id).delete()
                #delete fundedsite institution associations
                fundedsite_institution_link.objects.filter(institutionid=ins_id).delete()
                #delete institution itself
                institution.objects.filter(id=ins_id).delete()

            message = "Successfully deleted institution id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No institutions selected, please select institution for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

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
            if (request.POST.get('duplicate') == 'false'):
                try:
                    institution.objects.get(name=parameters['name'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"name":["There is already a institution with the same name."]}'})
                except institution.DoesNotExist:
                    pass
            ins_id = IdSeq.objects.raw("select sequence_name, nextval('institution_seq') from institution_seq")[0].nextval
            parameters["id"] = ins_id
            institutionm = InstitutionForm(parameters)
        
        if institutionm.is_valid():
            institutionm.save()

            #save institution data into db
            save_institution_links(ins_id, request)
        else:
            message = simplejson.dumps(institutionm.errors)
            success = False
        return JsonResponse({'Success':success,
                            'Message':message})

    #generate institution data from db
    data = gen_institution_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'institutioninput.html',
        data,
        context_instance=RequestContext(request)
    )
