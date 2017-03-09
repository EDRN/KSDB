# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
from ksdb import ekeutils
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import protocol, organ, organ_protocol_link, protocol_custodian_link, protocol_publication_link, person, pi_protocol_link, ci_protocol_link, fundedsite_protocol_link, fundedsite

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
        per_split = per.split(":")
        pi_protocol_linkm = pi_protocol_link(protocolid = pro_id, personid = per_split[0])
        pi_protocol_linkm.save()

    #delete and save new custodian protocol associations
    cuslist = request.POST.getlist('cus')
    protocol_custodian_link.objects.filter(protocolid=pro_id).delete()
    for cus in cuslist:
        cus_split = cus.split(":")
        protocol_custodian_linkm = protocol_custodian_link(protocolid = pro_id, personid = cus_split[0])
        protocol_custodian_linkm.save()

    #delete and save new publication protocol associations
    publist = request.POST.getlist('publications')
    protocol_publication_link.objects.filter(protocolid=pro_id).delete()
    for pub in publist:
        pub_split = pub.split(":")
        protocol_publication_linkm = protocol_publication_link(protocolid = pro_id, publicationid = pub)
        protocol_publication_linkm.save()

    #delete and save new person protocol associations
    cilist = request.POST.getlist('cis')
    ci_protocol_link.objects.filter(protocolid=pro_id).delete()
    for per in cilist:
        per_split = per.split(":")
        ci_protocol_linkm = ci_protocol_link(protocolid = pro_id, personid = per_split[0])
        ci_protocol_linkm.save()

    #delete and save new fundedsite protocol associations
    fundedsite_protocol_link.objects.filter(protocolid=pro_id).delete()
    fundedsitelist = request.POST.getlist('fundedsites')
    for org in fundedsitelist:
        fundedsite_protocol_linkm = fundedsite_protocol_link(protocolid = pro_id, fundedsiteid = org)
        fundedsite_protocol_linkm.save()

    #delete and save new organ protocol associations
    organ_protocol_link.objects.filter(protocolid=pro_id).delete()
    organlist = request.POST.getlist('organs')
    for org in organlist:
        organ_protocol_linkm = organ_protocol_link(protocolid = pro_id, organid = org)
        organ_protocol_linkm.save()

def gen_protocol_data(request):

    personfield = ekeutils.get_eke_list("person")
    publicationfield = ekeutils.get_eke_list("publication")
    organfield = ekeutils.get_eke_list("organ")
    fundedsitefield = ekeutils.get_eke_list("fundedsite")
    data = {"action" : "New" ,
                    "pis" : personfield ,
                    "cis" : personfield ,
                    "custodians" : personfield ,
                    "publications" : publicationfield ,
                    "organs" : organfield ,
                    "fundedsites" : fundedsitefield
            }
    if request.method == 'GET':
        protocolid = request.GET.get('id')
        if protocolid:
            #generate protocol info from db
            obj = protocol.objects.get(pk=int(protocolid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "pis" : personfield ,
                    "custodians" : personfield ,
                    "publications" : publicationfield ,
                    "cis" : personfield ,
                    "organs" : organfield ,
                    "fundedsites" : fundedsitefield ,
                    "title" : obj.title,
                    "shortname" : obj.shortname,
                    "organ_link_id" : [ opl.organid for opl in list(organ_protocol_link.objects.filter(protocolid=int(protocolid))) ],
                    "pi_link_id" : ",".join([ str(ppl.personid)+":"+person.objects.filter(id=ppl.personid)[0].firstname+" "+person.objects.filter(id=ppl.personid)[0].lastname for ppl in list(pi_protocol_link.objects.filter(protocolid=int(protocolid))) ]),
                    "ci_link_id" : ",".join([ str(ppl.personid)+":"+person.objects.filter(id=ppl.personid)[0].firstname+" "+person.objects.filter(id=ppl.personid)[0].lastname for ppl in list(ci_protocol_link.objects.filter(protocolid=int(protocolid))) ]),
                    "cus_link_id" : ",".join([ str(ppl.personid)+":"+person.objects.filter(id=ppl.personid)[0].firstname+" "+person.objects.filter(id=ppl.personid)[0].lastname for ppl in list(protocol_custodian_link.objects.filter(protocolid=int(protocolid))) ]),
                    "fundedsite_link_id" : [ fun.fundedsiteid for fun in list(fundedsite_protocol_link.objects.filter(protocolid=int(protocolid))) ],
                    "pub_link_id" : [ ppl.publicationid for ppl in list(protocol_publication_link.objects.filter(protocolid=int(protocolid))) ],
                    "start_date" : str(obj.start_date),
                    "irb_approval" : obj.irb_approval,
                    "irb_contact" : obj.irb_contact ,
                    "site_contact" : obj.site_contact ,
                    "irb_contact_email" : obj.irb_contact_email ,
                    "site_contact_email" : obj.site_contact_email ,
                    "irb_approval_num" : obj.irb_approval_num,
                    "hum_sub_train" : obj.hum_sub_train,
                    "abstract" : escapejs(obj.abstract),
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
                ci_protocol_link.objects.filter(protocolid=pro_id).delete()
                protocol_custodian_link.objects.filter(protocolid=pro_id).delete()

                fundedsite_protocol_link.objects.filter(protocolid=pro_id).delete()
                #delete organ protocol associations
                organ_protocol_link.objects.filter(protocolid=pro_id).delete()
                #delete publication protocol associations
                protocol_publication_link.objects.filter(protocolid=pro_id).delete()
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
            if (request.POST.get('duplicate') == 'false'):
                try:
                    protocol.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["There is already a protocol with the same title."]}'})
                except protocol.DoesNotExist:
                    pass
                except protocol.MultipleObjectsReturned:
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["There is already a protocol with the same title."]}'})

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
