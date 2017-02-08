# ekeutils.py
from django.http import JsonResponse
# Create your views here.
from django.db.models import Q
from ksdb.models import protocol, organ, person, fundedsite, project, degree, institution

_KSDBhref = "/ksdb/"

def eke_api(request):
    if request.GET.get("action") == "getobjlist":
        objlist = []
        if "filter" in request.GET:
            objlist = get_eke_list(request.GET.get("eketype"), filterby=request.GET.get("filter"))
        else:
            objlist = get_eke_list(request.GET.get("eketype"))
            
        return JsonResponse({'objlist':objlist})

def get_eke_list(eketype, filterby=None):
    field = []

    q = None
    if filterby:
        for word in filterby.split():
           q_aux = Q( firstname__icontains = word )
           q_aux2 = Q( lastname__icontains = word )
           q = ( (q_aux | q_aux2) & q ) if bool( q ) else (q_aux2 | q_aux)

    if eketype == "person":
        if filterby:
            field = [ { "id": str(obj.id)+":"+str(obj.firstname)+" "+str(obj.lastname), "name": str(obj.firstname)+" "+str(obj.lastname)} for obj in list(person.objects.filter( q )) ]
        else:
            field = [ [str(obj.id), str(obj.firstname)+" "+str(obj.lastname)] for obj in list(person.objects.all()) ]
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
    elif eketype == "project":
        field = [ [str(obj.id), str(obj.title)] for obj in list(project.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())
    elif eketype == "protocol":
        field = [ [str(obj.id), str(obj.title)] for obj in list(protocol.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())

    return field

def getPersonNameByID(perid):
    try:
        per = person.objects.get(id = perid)
        return str(per.lastname)+" "+str(per.firstname)
    except:
        return None

def getProjectTitleByID(proid):
    try:
        pro = project.objects.get(id = proid)
        return str(pro.title)
    except:
        return None
