# ekeutils.py
from django.http import JsonResponse
# Create your views here.
from django.db.models import Q
from ksdb.models import protocol, organ, person, fundedsite, program, degree, institution, publication, institution_personnel_link

import re

_KSDBhref = "/ksdb/"

def getPersonnelFromInst(institutions, q=None):
    persons = None
    if q:
        person_objs = person.objects.filter(id__in = [ipl.personid for ipl in institution_personnel_link.objects.filter(institutionid__in = institutions)])
        persons = person_objs.filter(q)
    else:
        persons = person.objects.filter(id__in = [ipl.personid for ipl in institution_personnel_link.objects.filter(institutionid__in = institutions)])
    return persons

def eke_api(request):
    if request.GET.get("action") == "getobjlist":
        objlist = []
        if "filter" in request.GET:
            objlist = get_eke_list(request.GET.get("eketype"), filterby=request.GET.get("filterby"), filterval=request.GET.get("filtervalue"), filtersearch=request.GET.get("filter"))
        else:
            objlist = get_eke_list(request.GET.get("eketype"), filterby=request.GET.get("filterby"), filterval=request.GET.get("filtervalue"))
            
        return JsonResponse({'objlist':objlist})

def get_eke_list(eketype, filterby=None, filterval=None, filtersearch=None):
    field = []

    q = None
    if filtersearch:
        for word in filtersearch.split():
           q_aux = Q( firstname__icontains = word )
           q_aux2 = Q( lastname__icontains = word )
           q = ( (q_aux | q_aux2) & q ) if bool( q ) else (q_aux2 | q_aux)

    if eketype == "person":
        persons = None
        if filterby and filterval:
            if filterby != '' and filterval != '':
                if filterby == 'institution':
                    persons = getPersonnelFromInst(list(map(int, filterval.split(','))), q)
        if persons is None:
            if q:
                persons = person.objects.filter( q )
            else:
                persons = person.objects.all()
        field = [ { "id": str(obj.id)+":"+str(obj.firstname)+" "+str(obj.lastname), "name": str(obj.firstname)+" "+str(obj.lastname)} for obj in list(persons) ]
        #field.sort(key=lambda x: x[1].lower())
    elif eketype == "organ":
        field = [ [str(obj.id), str(obj.name)] for obj in list(organ.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())
    elif eketype == "fundedsite":
        field = [ [str(obj.id), str(obj.name)] for obj in list(fundedsite.objects.all()) ]
        field.sort(key=lambda x: x[1])
    elif eketype == "institution":
        field = [ [str(obj.id), str(obj.name)] for obj in list(institution.objects.all()) ]
        field.sort(key=lambda x: x[1].lower()) 
    elif eketype == "degree":
        field = [ [str(obj.id), str(obj.title)] for obj in list(degree.objects.all()) ]
        field.sort(key=lambda x: x[1].lower()) 
    elif eketype == "program":
        field = [ [str(obj.id), str(obj.title)] for obj in list(program.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())
    elif eketype == "protocol":
        field = [ [str(obj.id), str(obj.title)] for obj in list(protocol.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())
    elif eketype == "publication":
        field = [ [str(obj.id), str(obj.title)] for obj in list(publication.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())

    return field


def getPersonNameByID(perid):
    try:
        per = person.objects.get(id = perid)
        return str(per.lastname)+" "+str(per.firstname)
    except:
        return None

def getProgramTitleByID(proid):
    try:
        pro = program.objects.get(id = proid)
        return str(pro.title)
    except:
        return None

def format_phone(phone):
    # strip non-numeric characters
    phone = phone.lower().strip()
    if phone == "":
        return phone
    extension = ""
    if 'ext' in phone:
        phone, extension = phone.split('ext')
    if 'x' in phone:
        phone, extension = phone.split('x')
    phone = re.sub(r'\D', '', phone)
    # remove leading 1 (area codes never start with 1)
    if len(phone) == 11:
        return ['+{} ({}) {}.{}'.format(phone[0], phone[1:4], phone[4:7], phone[7:11]), extension]
    elif len(phone) == 10:
        return ['+1 ({}) {}.{}'.format(phone[0:3], phone[3:6], phone[6:10]), extension]
    else:
        return None
        
