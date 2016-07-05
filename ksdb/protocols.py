# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import protocol, organ, organ_protocol_link, person, pi_protocol_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import ProtocolForm

#import settings
from django.conf import settings
import logging
logger = logging.getLogger(__name__)


def protocol_input(request):
    if request.method == 'POST':
        #title = request.POST.get('protocoltitle')
        #description = request.POST.get('protocoldesc')
        #organlist = request.POST.getlist('protocolorgan')
        #pilist = request.POST.getlist('protocolpi')
        #start = request.POST.get('protocolstartinput')
        #contact = request.POST.get('protocolsitecontact')
        #irbapproval = request.POST.get('protocolirbapproval')
        #approvalnum = request.POST.get('protocolapprovalnum')
        #irbcontact = request.POST.get('protocolirbcontact')
        #email = request.POST.get('protocolcontactemail')
        #humsubtrain = request.POST.get('protocolhumsubtrain')
        #abstract = request.POST.get('protocolabstract')

        pro_id = None
        message = "You have successfully added a protocol."
        success = True
        parameters = copy.copy(request.POST)
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
            
#        if request.POST.get('action') == "edit":
#        else:

        #protocolm = protocol(id = pro_id,
        #                    title = title, 
        #                    description = description, 
        #                    organs = ",".join(organlist), 
        #                    pis = ",".join(pilist), 
        #                    start_date = start, 
        #                    site_contact = contact, 
        #                    irb_approval = irbapproval, 
        #                    irb_approval_num = approvalnum, 
        #                    irb_contact = irbcontact, 
        #                    contact_email = email, 
        #                    hum_sub_train = humsubtrain, 
        #                    abstract = abstract, 
        #            )
        if protocolm.is_valid():
            protocolm.save()

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
        else:
            message = simplejson.dumps(protocolm.errors)
            success = False
        return JsonResponse({'Success':success,
                                'Message':message})

    
    personfield = [ [str(obj.id), str(obj.firstname), str(obj.lastname)] for obj in list(person.objects.all()) ]
    organfield = [ [str(obj.id), str(obj.name)] for obj in list(organ.objects.all()) ]
    data = {"action" : "New" ,
                    "pis" : personfield ,
                    "organs" : organfield ,
            }
    if request.method == 'GET':
        protocolid = request.GET.get('id')
        if protocolid:
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
                    "site_contact" : obj.site_contact,
                    "irb_approval" : obj.irb_approval,
                    "irb_approval_num" : obj.irb_approval_num,
                    "irb_contact" : obj.irb_contact,
                    "contact_email" : obj.contact_email,
                    "hum_sub_train" : obj.hum_sub_train,
                    "abstract" : obj.abstract,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'protocolinput.html',
        data,
        context_instance=RequestContext(request)
    )
