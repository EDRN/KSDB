# protocols.py
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.html import escapejs
import copy, simplejson
from ksdb.ekeutils import getAttrVal

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import program, fundedsite_program_link, knowledge_object_types, knowledge_attributes, knowledge_objects, knowledge_values

# Allow external command processing
from django.http import JsonResponse

from ksdb.forms import ProgramForm
from django.forms import ValidationError
#import settings
import logging
logger = logging.getLogger(__name__)

def gen_program_data(request):
    data = {"action" : "New" ,
           }
    if request.method == 'GET':
        programid = request.GET.get('id')
        if programid:
            obj = knowledge_objects.objects.get(pk=int(programid))
            vals = obj.knowledge_values_set.all()
            data = { "action" : "Edit",
                    "id" : obj.id}
            for val in vals:
                attr = knowledge_attributes.objects.get(id=val.obj_attr_id)
                data[attr.obj_attr_name] = getAttrVal(attr.obj_attr_type, val)
    return data

def delete_program(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for pro_id in ids:
                #delete person program associations
                knowledge_objects.objects.filter(id=pro_id).delete()
                #delete program itself
                knowledge_link.objects.filter(sourceid=pro_id).delete()
                knowledge_link.objects.filter(targetid=pro_id).delete()

            message = "Successfully deleted program id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No programs selected, please select program for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."

    return JsonResponse({'Success':success,
                                'Message':message})
@login_required(login_url="/ksdb/login/")
def program_input(request):
    if request.method == 'POST':

        pro_id = None
        message = "You have successfully added a program."
        success = True
        parameters = copy.copy(request.POST)

        if request.POST.get('action') == "edit":
            pro_id = int(request.POST.get('programid'))
            message = "You have successfull edited program "+str(pro_id)+"."
            parameters["id"] = pro_id
            programi = knowledge_objects.objects.get(id=pro_id)
            programm = ProgramForm(parameters or None, instance=programi)
        else:
            if (request.POST.get('duplicate') == 'false'):
                try:
                    program.objects.get(title=parameters['title'])
                    return JsonResponse({'Success':False,
                                        'Message':'{"title":["There is already a program with the same title."]}'})
                except program.DoesNotExist:
                    pass
            pro_id = IdSeq.objects.raw("select sequence_name, nextval('object_seq') from object_seq")[0].nextval
            parameters["id"] = pro_id
            programm = ProgramForm(parameters)
        
        if programm.is_valid():
            programm.save()
        else:
            message = simplejson.dumps(programm.errors)
            success = False
        return JsonResponse({'Success':success,
                             'Message':message})

    #generate protocol data from db
    data = gen_program_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'programinput.html',
        data,
        context_instance=RequestContext(request)
    )
