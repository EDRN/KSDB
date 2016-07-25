# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import protocol, organ, organ_protocol_link, person, pi_protocol_link, protocol_sitecon_link, protocol_irbcon_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import ProtocolForm

#import settings
from django.conf import settings
import logging
logger = logging.getLogger(__name__)

def save_protocol_links(pro_id, request):
    #delete and save new person protocol associations
    pilist = request.POST.getlist('pis')
    pi_protocol_link.objects.filter(protocolid=pro_id).delete()
    for per in pilist:
        pi_protocol_linkm = pi_protocol_link(protocolid = pro_id, personid = per)
        pi_protocol_linkm.save()

    #delete and save new organ protocol associations
    organ_protocol_link.objects.filter(protocolid=pro_id).delete()
    organlist = request.POST.getlist('organs')
    for org in organlist:
        organ_protocol_linkm = organ_protocol_link(protocolid = pro_id, organid = org)
        organ_protocol_linkm.save()

    #delete and save new site contact protocol associations
    protocol_sitecon_link.objects.filter(protocolid=pro_id).delete()
    siteconlist = request.POST.getlist('site_contact')
    for site in siteconlist:
        protocol_sitecon_linkm = protocol_sitecon_link(protocolid = pro_id, personid = site)
        protocol_sitecon_linkm.save()

    #delete and save new organ protocol associations
    protocol_irbcon_link.objects.filter(protocolid=pro_id).delete()
    irbconlist = request.POST.getlist('irb_contact')
    for irb in irbconlist:
        protocol_irbcon_linkm = protocol_irbcon_link(protocolid = pro_id, personid = irb)
        protocol_irbcon_linkm.save()

def gen_protocol_data(request):

    personfield = [ [str(obj.id), str(obj.firstname), str(obj.lastname)] for obj in list(person.objects.all()) ]
    organfield = [ [str(obj.id), str(obj.name)] for obj in list(organ.objects.all()) ]
    data = {"action" : "New" ,
                    "pis" : personfield ,
                    "irb_contact" : personfield ,
                    "site_contact" : personfield ,
                    "organs" : organfield ,
            }
    if request.method == 'GET':
        protocolid = request.GET.get('id')
        if protocolid:
            #generate protocol info from db
            obj = protocol.objects.get(pk=int(protocolid))

            data = { "action" : "Edit",
                    "id" : obj.id,
                    "pis" : personfield ,
                    "organs" : organfield ,
                    "title" : obj.title,
                    "description" : obj.description,
                    "organ_link_id" : [ opl.organid for opl in list(organ_protocol_link.objects.filter(protocolid=int(protocolid))) ],
                    "pi_link_id" : [ ppl.personid for ppl in list(pi_protocol_link.objects.filter(protocolid=int(protocolid))) ],
                    "start_date" : str(obj.start_date),
                    "irbcon_link_id" : [ pil.personid for pil in list(protocol_irbcon_link.objects.filter(protocolid=int(protocolid))) ],
                    "sitecon_link_id" : [ psl.personid for psl in list(protocol_sitecon_link.objects.filter(protocolid=int(protocolid))) ],
                    "irb_approval" : obj.irb_approval,
                    "irb_contact" : personfield ,
                    "site_contact" : personfield ,
                    "irb_approval_num" : obj.irb_approval_num,
                    "hum_sub_train" : obj.hum_sub_train,
                    "abstract" : obj.abstract,
                   }
    return data

def delete_protocol(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for pro_id in ids:
                #delete person protocol associations
                pi_protocol_link.objects.filter(protocolid=pro_id).delete()
                #delete organ protocol associations
                organ_protocol_link.objects.filter(protocolid=pro_id).delete()
                #delete site contact protocol associations
                protocol_sitecon_link.objects.filter(protocolid=pro_id).delete()
                #delete organ protocol associations
                protocol_irbcon_link.objects.filter(protocolid=pro_id).delete()
                #delete protocol itself
                protocol.objects.filter(id=pro_id).delete()

            message = "Successfully deleted protocol id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No protocols selected, please select protocol for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})
def protocol_input(request):
    if request.method == 'POST':
        pro_id = None
        message = "You have successfully added a protocol."
        success = True
        parameters = copy.copy(request.POST)

        #determine if this is a new protocol or editing existing
        if request.POST.get('action') == "edit":
            pro_id = int(request.POST.get('protocolid'))
            message = "You have successfull edited protocol "+str(pro_id)+"."
            parameters["id"] = pro_id
            protocoli = protocol.objects.get(id=pro_id)
            protocolm = ProtocolForm(parameters or None, instance=protocoli)
        else:
            pro_id = IdSeq.objects.raw("select sequence_name, nextval('protocol_seq') from protocol_seq")[0].nextval
            parameters["id"] = pro_id
            protocolm = ProtocolForm(parameters)
            
        if protocolm.is_valid():
            protocolm.save()

            #save protocol data into db
            save_protocol_links(pro_id, request)

        else:
            message = simplejson.dumps(protocolm.errors)
            success = False
        return JsonResponse({'Success':success,
                                'Message':message})

    #generate protocol data from db
    data = gen_protocol_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'protocolinput.html',
        data,
        context_instance=RequestContext(request)
    )
