# committees.py
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
from ksdb import ekeutils
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import committee, committee_member_link, committee_program_link, person, program

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import CommitteeForm

#import settings
import logging
logger = logging.getLogger(__name__)

def save_committee_links(com_id, request):
    #delete and save new person, member to committee associations
    members = request.POST.getlist('members')
    committee_member_link.objects.filter(committeeid=com_id).delete()
    for per in members:
        per_split = per.split(":")
        committee_member_linkm = committee_member_link(committeeid = com_id, personid = per_split[0])
        committee_member_linkm.save()

    #delete and save new program committee associations
    programs = request.POST.getlist('programs')
    committee_program_link.objects.filter(committeeid=com_id).delete()
    for pro in programs:
        committee_program_linkm = committee_program_link(committeeid = com_id, programid = pro)
        committee_program_linkm.save()

def gen_committee_data(request):
    programfield = [ [str(obj.id), str(obj.title)] for obj in list(program.objects.all()) ]
    programfield.sort(key=lambda x: x[1].lower())
    personfield = ekeutils.get_eke_list("person")
    data = {"action" : "New" ,
        "members" : personfield ,
        "programs" : programfield ,
       }
    if request.method == 'GET':
        committeeid = request.GET.get('id')
        if committeeid:
            obj = committee.objects.get(pk=int(committeeid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : escapejs(obj.description),
                    "abbreviation" : obj.abbreviation,
                    "member_link_id" : ",".join([ str(ppl.personid)+":"+person.objects.filter(id=ppl.personid)[0].firstname+" "+person.objects.filter(id=ppl.personid)[0].lastname for ppl in list(committee_member_link.objects.filter(committeeid=int(committeeid))) ]),
                    "program_link_id" : [ fpl.programid for fpl in list(committee_program_link.objects.filter(committeeid=int(committeeid))) ],
                    "members" : personfield ,
                    "programs" : programfield ,
                    "title" : obj.title ,
                   }
    return data

def delete_committee(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for com_id in ids:
                #delete member committee associations
                committee_member_link.objects.filter(committeeid=com_id).delete()
                #delete program committee associations
                committee_program_link.objects.filter(committeeid=com_id).delete()
                #delete committee itself
                committee.objects.filter(id=com_id).delete()

            message = "Successfully deleted committee id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No committees selected, please select committee for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def committee_input(request):
    #check if this is change of institution event or regular save/edit post
    instchange = request.POST.get('instchange', 0)
    if request.method == 'POST' and instchange == 0:
        com_id = None
        message = "You have successfully added a committee."
        success = True
        parameters = copy.copy(request.POST)
        if request.POST.get('action') == "edit":
            com_id = int(request.POST.get('committeeid'))
            message = "You have successfull edited committee "+str(com_id)+"."
            parameters["id"] = com_id
            programs = request.POST.getlist('programs')
            parameters['programs'] = ", ".join(programs)
            members = request.POST.getlist('members')
            parameters['members'] = ", ".join(members)
            committeei = committee.objects.get(id=com_id)
            committeem = CommitteeForm(parameters or None, instance=committeei)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    committee.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"name":["There is already a committee with the same title."]}'})
                except committee.DoesNotExist:
                    pass
            com_id = IdSeq.objects.raw("select sequence_name, nextval('committee_seq') from committee_seq")[0].nextval
            parameters["id"] = com_id
            committeem = CommitteeForm(parameters)

        if committeem.is_valid():
            committeem.save()

            #save committee data into db
            save_committee_links(com_id, request)
        else:
            message = simplejson.dumps(committeem.errors)
            success = False

        return JsonResponse({'Success':success,
                                'Message':message})

    #generate committee data from db
    data = gen_committee_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'committeeinput.html',
        data,
        context_instance=RequestContext(request)
    )
