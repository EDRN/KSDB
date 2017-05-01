# persons.py
from ksdb.ekeutils import format_phone
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import person, degree, person_degree_link, fundedsite_staff_link, fundedsite_pi_link, publication_author_link, institution_personnel_link, pi_protocol_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import PersonForm

#import settings
import logging
logger = logging.getLogger(__name__)

def save_person_links(per_id, request):
    #delete and save new person degree associations
    degrees = request.POST.getlist('degrees')
    person_degree_link.objects.filter(personid=per_id).delete()
    for deg in degrees:
        person_degree_linkm = person_degree_link(personid = per_id, degreeid = deg)
        person_degree_linkm.save()

def gen_person_data(request):
    degreefield = [ [str(obj.id), str(obj.title)] for obj in list(degree.objects.all()) ]
    degreefield.sort(key=lambda x: x[1].lower())
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
                    "dcpflag" : obj.dcp,
                    "dcbflag" : obj.dcb,
                    "degree_link_id" : [ pdl.degreeid for pdl in list(person_degree_link.objects.filter(personid=int(personid))) ],
                    "degrees" : degreefield,
                    "email" : obj.email or "",
                    "telephone" : obj.telephone or "",
                    "extension" : obj.extension or "",
                    "description" : escapejs(obj.description),
                   }
    return data

def delete_person(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for per_id in ids:
                #delete pi protocol associations
                pi_protocol_link.objects.filter(personid=per_id).delete()
                #delete institution person associations
                institution_personnel_link.objects.filter(personid=per_id).delete()
                #delete publication author associations
                #publication_author_link.objects.filter(personid=per_id).delete()
                #delete funded site pi associations
                fundedsite_pi_link.objects.filter(personid=per_id).delete()
                #delete fundedsite staff associations
                fundedsite_staff_link.objects.filter(personid=per_id).delete()
                #delete degree and person assocations
                person_degree_link.objects.filter(personid=per_id).delete()
                #delete person itself
                person.objects.filter(id=per_id).delete()
            message = "Successfully deleted person id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No persons selected, please select person for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def person_input(request):
    if request.method == 'POST':
        per_id = None
        message = "You have successfully added a person."
        success = True
        parameters = copy.copy(request.POST)
        new_phone = format_phone(parameters["telephone"])
        if new_phone:
            if new_phone != "":
              parameters["telephone"] = new_phone[0]
              if new_phone[1] != "":
                  parameters["extension"] = new_phone[1]

        if request.POST.get('action') == "edit":
            per_id = int(request.POST.get('personid'))
            message = "You have successfull edited person "+str(per_id)+"."
            parameters["id"] = per_id
            #assign dcb and dcp flag because checkbox somehow require custom value extraction
            parameters["dcp"] = request.POST.get('dcp')
            parameters["dcb"] = request.POST.get('dcb')
            personi = person.objects.get(id=per_id)
            personm = PersonForm(parameters or None, instance=personi)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    person.objects.get(firstname=parameters['firstname'], lastname=parameters['lastname'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"firstname":["There is already a person with the same first and last name."],"lastname":["There is already a person with the same first and last name."]}'})
                except person.DoesNotExist:
                    pass
                except person.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                        'Message':'{"firstname":["There is already a person with the same first and last name."],"lastname":["There is already a person with the same first and last name."]}'})

            per_id = IdSeq.objects.raw("select sequence_name, nextval('person_seq') from person_seq")[0].nextval
            parameters["id"] = per_id
            personm = PersonForm(parameters)
        if personm.is_valid() and new_phone is not None:
            personm.save()

            #save personnel data into db
            save_person_links(per_id, request)
        else:
            if new_phone is None:
                personm.errors["telephone"] = ["Incorrect format. Must be 10 digits for US or 11 digits for international."]
            message = simplejson.dumps(personm.errors)
            success = False

        return JsonResponse({'Success':success,
                            'Message':message})

    #generate personnel data from db
    data = gen_person_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'personinput.html',
        data,
        context_instance=RequestContext(request)
    )
