# groups.py
from django.shortcuts import render_to_response
from django.template import RequestContext
from ksdb import ekeutils
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import group, group_member_link, group_program_link, person, program

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import GroupForm

#import settings
import logging
logger = logging.getLogger(__name__)

def save_group_links(grp_id, request):
    #delete and save new person group associations
    members = request.POST.getlist('members')
    group_member_link.objects.filter(groupid=grp_id).delete()
    for per in members:
        per_split = per.split(":")
        group_member_linkm = group_member_link(groupid = grp_id, personid = per_split[0])
        group_member_linkm.save()

    #delete and save new program group associations
    programs = request.POST.getlist('programs')
    group_program_link.objects.filter(groupid=grp_id).delete()
    for pro in programs:
        group_program_linkm = group_program_link(groupid = grp_id, programid = pro)
        group_program_linkm.save()

def gen_group_data(request):
    programfield = [ [str(obj.id), str(obj.title)] for obj in list(program.objects.all()) ]
    programfield.sort(key=lambda x: x[1].lower())
    personfield = ekeutils.get_eke_list("person")
    data = {"action" : "New" ,
        "members" : personfield ,
        "programs" : programfield ,
       }
    if request.method == 'GET':
        groupid = request.GET.get('id')
        if groupid:
            obj = group.objects.get(pk=int(groupid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : obj.description,
                    "member_link_id" : ",".join([ str(ppl.personid)+":"+person.objects.filter(id=ppl.personid)[0].firstname+" "+person.objects.filter(id=ppl.personid)[0].lastname for ppl in list(group_member_link.objects.filter(groupid=int(groupid))) ]),
                    "program_link_id" : [ fpl.programid for fpl in list(group_program_link.objects.filter(groupid=int(groupid))) ],
                    "members" : personfield ,
                    "programs" : programfield ,
                    "name" : obj.name ,
                   }
    return data

def delete_group(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for grp_id in ids:
                #delete pi group associations
                group_member_link.objects.filter(groupid=grp_id).delete()
                #delete program group associations
                group_program_link.objects.filter(groupid=grp_id).delete()
                #delete group itself
                group.objects.filter(id=grp_id).delete()

            message = "Successfully deleted group id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No groups selected, please select group for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def group_input(request):
    #check if this is change of institution event or regular save/edit post
    instchange = request.POST.get('instchange', 0)
    if request.method == 'POST' and instchange == 0:
        grp_id = None
        message = "You have successfully added a group."
        success = True
        parameters = copy.copy(request.POST)
        if request.POST.get('action') == "edit":
            grp_id = int(request.POST.get('groupid'))
            message = "You have successfull edited group "+str(grp_id)+"."
            parameters["id"] = grp_id
            programs = request.POST.getlist('programs')
            parameters['programs'] = ", ".join(programs)
            members = request.POST.getlist('members')
            parameters['members'] = ", ".join(members)
            groupi = group.objects.get(id=grp_id)
            groupm = GroupForm(parameters or None, instance=groupi)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    group.objects.get(name=parameters['name'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"name":["There is already a participating site with the same name."]}'})
                except group.DoesNotExist:
                    pass
            grp_id = IdSeq.objects.raw("select sequence_name, nextval('group_seq') from group_seq")[0].nextval
            parameters["id"] = grp_id
            groupm = GroupForm(parameters)


        if groupm.is_valid():
            groupm.save()

            #save group data into db
            save_group_links(grp_id, request)
        else:
            message = simplejson.dumps(groupm.errors)
            success = False

        return JsonResponse({'Success':success,
                                'Message':message})

    #generate group data from db
    data = gen_group_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'groupinput.html',
        data,
        context_instance=RequestContext(request)
    )
