# fundedsites.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import fundedsite, fundedsite_pi_link, fundedsite_staff_link, fundedsite_organ_link, person, organ

# Allow external command processing
from django.http import JsonResponse

#import settings
import logging
logger = logging.getLogger(__name__)

def fundedsite_input(request):
    if request.method == 'POST':
        title = request.POST.get('fundedsitetitle')
        description = request.POST.get('fundedsitedesc')
        abstract = request.POST.get('fundedsiteabstract')
        pis = request.POST.getlist('fundedsitepi')
        staffs = request.POST.getlist('fundedsitestaff')
        organs = request.POST.getlist('fundedsiteorgan')

        fun_id = None
        message = "You have successfully added a fundedsite."
        if request.POST.get('action') == "edit":
            fun_id = int(request.POST.get('fundedsiteid'))
            message = "You have successfull edited fundedsite "+str(fun_id)+"."
        else:
            fun_id = IdSeq.objects.raw("select sequence_name, nextval('fundedsite_seq') from fundedsite_seq")[0].nextval

        fundedsitem = fundedsite(id = fun_id, 
                            title = title, 
                            description = description, 
                            abstract = abstract, 
                            pis= ",".join(pis), 
                            staff= ",".join(staffs), 
                            organs= ",".join(organs), 
                            
                    )
        fundedsitem.save()

        #delete and save new person fundedsite associations
        fundedsite_pi_link.objects.filter(fundedsiteid=fun_id).delete()
        for per in pis:
            fundedsite_pi_linkm = fundedsite_pi_link(fundedsiteid = fun_id, personid = per)
            fundedsite_pi_linkm.save()


        #delete and save new person fundedsite associations
        fundedsite_staff_link.objects.filter(fundedsiteid=fun_id).delete()
        for per in staffs:
            fundedsite_staff_linkm = fundedsite_staff_link(fundedsiteid = fun_id, personid = per)
            fundedsite_staff_linkm.save()


        #delete and save new person fundedsite associations
        fundedsite_organ_link.objects.filter(fundedsiteid=fun_id).delete()
        for org in organs:
            fundedsite_organ_linkm = fundedsite_organ_link(fundedsiteid = fun_id, organid = org)
            fundedsite_organ_linkm.save()

        return JsonResponse({'Success':"True",
                             'errors':'',
                                'Message':message})

    personfield = [ [str(obj.id), str(obj.firstname), str(obj.lastname)] for obj in list(person.objects.all()) ]
    organfield = [ [str(obj.id), str(obj.name)] for obj in list(organ.objects.all()) ]
    print organfield
    data = {"action" : "New" ,
            "pis" : personfield ,
            "staffs" : personfield ,
            "organs" : organfield ,
           }
    if request.method == 'GET':
        fundedsiteid = request.GET.get('id')
        if fundedsiteid:
            obj = fundedsite.objects.get(pk=int(fundedsiteid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "title" : obj.title,
                    "description" : obj.description,
                    "abstract" : obj.abstract,
                    "pi_link_id" : [ fpl.personid for fpl in list(fundedsite_pi_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "staff_link_id" : [ fsl.personid for fsl in list(fundedsite_staff_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "organ_link_id" : [ fol.organid for fol in list(fundedsite_organ_link.objects.filter(fundedsiteid=int(fundedsiteid))) ],
                    "pis" : personfield ,
                    "staffs" : personfield ,
                    "organs" : organfield ,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'fundedsiteinput.html',
        data,
        context_instance=RequestContext(request)
    )
