# fundedsites.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import fundedsite, fundedsite_pi_link, con_fundedsite_link, fundedsite_staff_link, fundedsite_organ_link, fundedsite_institution_link, fundedsite_program_link, person, organ, program, institution,institution_personnel_link, fundedsite_protocol_link

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import FundedsiteForm

#import settings
import logging
logger = logging.getLogger(__name__)

def getPersonnelFromInst(institutions):
    personfield = []
    for ins in institutions:
        for ipl in institution_personnel_link.objects.filter(institutionid = ins):
            per = person.objects.get(id = ipl.personid)
            personfield.append([str(per.id), str(per.firstname), str(per.lastname)])
    personfield.sort(key=lambda x: x[1].lower())
    return personfield

def save_fundedsite_links(fun_id, request):
    #delete and save new person fundedsite associations
    pis = request.POST.getlist('pis')
    fundedsite_pi_link.objects.filter(fundedsiteid=fun_id).delete()
    for per in pis:
        fundedsite_pi_linkm = fundedsite_pi_link(fundedsiteid = fun_id, personid = per)
        fundedsite_pi_linkm.save()

    #delete and save new contact fundedsite associations
    contacts = request.POST.getlist('contacts')
    con_fundedsite_link.objects.filter(fundedsiteid=fun_id).delete()
    for per in contacts:
        per_split = per.split(":")
        con_fundedsite_linkm = con_fundedsite_link(fundedsiteid = fun_id, personid = per_split[0])
        con_fundedsite_linkm.save()

    #delete and save new person fundedsite associations
    staffs = request.POST.getlist('staff')
    fundedsite_staff_link.objects.filter(fundedsiteid=fun_id).delete()
    for per in staffs:
        fundedsite_staff_linkm = fundedsite_staff_link(fundedsiteid = fun_id, personid = per)
        fundedsite_staff_linkm.save()

    #delete and save new person fundedsite associations
    organs = request.POST.getlist('organs')
    fundedsite_organ_link.objects.filter(fundedsiteid=fun_id).delete()
    for org in organs:
        fundedsite_organ_linkm = fundedsite_organ_link(fundedsiteid = fun_id, organid = org)
        fundedsite_organ_linkm.save()

    #delete and save new program fundedsite associations
    programs = request.POST.getlist('programs')
    fundedsite_program_link.objects.filter(fundedsiteid=fun_id).delete()
    for pro in programs:
        fundedsite_program_linkm = fundedsite_program_link(fundedsiteid = fun_id, programid = pro)
        fundedsite_program_linkm.save()

    #delete and save new institution fundedsite associations
    institutions = request.POST.getlist('institutions')
    fundedsite_institution_link.objects.filter(fundedsiteid=fun_id).delete()
    for ins in institutions:
        fundedsite_institution_linkm = fundedsite_institution_link(fundedsiteid = fun_id, institutionid = ins)
        fundedsite_institution_linkm.save()

def gen_fundedsite_data(request):
    organfield = [ [str(obj.id), str(obj.name)] for obj in list(organ.objects.all()) ]
    programfield = [ [str(obj.id), str(obj.title)] for obj in list(program.objects.all()) ]
    institutionfield = [ [str(obj.id), str(obj.name)] for obj in list(institution.objects.all()) ]
    organfield.sort(key=lambda x: x[1].lower())
    programfield.sort(key=lambda x: x[1].lower())
    institutionfield.sort(key=lambda x: x[1].lower())
    data = {"action" : "New" ,
        "pis" : [] ,
        "contacts" : [] ,
        "staffs" : [] ,
        "organs" : organfield ,
        "programs" : programfield ,
        "institutions" : institutionfield ,
       }
    if request.method == 'GET':
        fundedsiteid = request.GET.get('id')
        if fundedsiteid:
            obj = fundedsite.objects.get(pk=int(fundedsiteid))
            institutionids = [ fil.institutionid for fil in list(fundedsite_institution_link.objects.filter(fundedsiteid=int(fundedsiteid))) ]
            personfield = getPersonnelFromInst(institutionids)
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "description" : obj.description,
                    "pi_link_id" : [ fpl.personid for fpl in list(fundedsite_pi_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "contact_link_id" : ",".join([ str(ppl.personid)+":"+person.objects.filter(id=ppl.personid)[0].firstname+" "+person.objects.filter(id=ppl.personid)[0].lastname for ppl in list(con_fundedsite_link.objects.filter(fundedsiteid=int(fundedsiteid))) ]),
                    "staff_link_id" : [ fsl.personid for fsl in list(fundedsite_staff_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "organ_link_id" : [ fol.organid for fol in list(fundedsite_organ_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "program_link_id" : [ fpl.programid for fpl in list(fundedsite_program_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "institution_link_id" : institutionids,
                    "pis" : personfield ,
                    "contacts" : personfield ,
                    "staffs" : personfield ,
                    "organs" : organfield ,
                    "programs" : programfield ,
                    "name" : obj.name ,
                    "funding_date_start" : str(obj.funding_date_start),
                    "funding_date_finish" : str(obj.funding_date_finish),
                    "institutions" : institutionfield ,
                    "status" : obj.status ,
                   }
    return data

def delete_fundedsite(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for fun_id in ids:
                #delete pi fundedsite associations
                fundedsite_pi_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete contact fundedsite associations
                con_fundedsite_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete staff fundedsite associations
                fundedsite_staff_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete organ fundedsite associations
                fundedsite_organ_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete program fundedsite associations
                fundedsite_program_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete institution fundedsite associations
                fundedsite_institution_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete protocol fundedsite associations
                fundedsite_protocol_link.objects.filter(fundedsiteid=fun_id).delete()
                #delete fundedsite itself
                fundedsite.objects.filter(id=fun_id).delete()

            message = "Successfully deleted fundedsite id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No fundedsites selected, please select fundedsite for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def fundedsite_input(request):
    #check if this is change of institution event or regular save/edit post
    instchange = request.POST.get('instchange', 0)
    if request.method == 'POST' and instchange == 0:
        fun_id = None
        message = "You have successfully added a fundedsite."
        success = True
        parameters = copy.copy(request.POST)
        if request.POST.get('action') == "edit":
            fun_id = int(request.POST.get('fundedsiteid'))
            message = "You have successfull edited fundedsite "+str(fun_id)+"."
            parameters["id"] = fun_id
            programs = request.POST.getlist('programs')
            parameters['programs'] = ", ".join(programs)
            pis = request.POST.getlist('pis')
            parameters['pis'] = ", ".join(pis)
            contacts = request.POST.getlist('contacts')
            parameters['contacts'] = ", ".join(contacts)
            fundedsitei = fundedsite.objects.get(id=fun_id)
            fundedsitem = FundedsiteForm(parameters or None, instance=fundedsitei)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    fundedsite.objects.get(name=parameters['name'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"name":["There is already a participating site with the same name."]}'})
                except fundedsite.DoesNotExist:
                    pass
            fun_id = IdSeq.objects.raw("select sequence_name, nextval('fundedsite_seq') from fundedsite_seq")[0].nextval
            parameters["id"] = fun_id
            fundedsitem = FundedsiteForm(parameters)


        if fundedsitem.is_valid():
            fundedsitem.save()

            #save fundedsite data into db
            save_fundedsite_links(fun_id, request)
        else:
            message = simplejson.dumps(fundedsitem.errors)
            success = False

        return JsonResponse({'Success':success,
                                'Message':message})

    elif request.method == 'POST' and instchange == "1":
            institutions = request.POST.getlist('institutions')
            personfield = getPersonnelFromInst(institutions)
            return JsonResponse({'Personnel':personfield})
    
    #generate fundedsite data from db
    data = gen_fundedsite_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'fundedsiteinput.html',
        data,
        context_instance=RequestContext(request)
    )
