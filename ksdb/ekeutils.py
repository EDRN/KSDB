# ekeutils.py
from django.http import JsonResponse
# Create your views here.
from ksdb.models import protocol, organ, person, fundedsite, project, degree, institution

_KSDBhref = "/ksdb/"

def eke_api(request):
    if request.GET.get("action") == "getobjlist":
        objlist = get_eke_list(request.GET.get("eketype"))
        return JsonResponse({'objlist':objlist})

def get_eke_list(eketype, filterby=None):
    field = []
    if eketype == "person":
        field = [ [str(obj.id), str(obj.firstname)+" "+str(obj.lastname)] for obj in list(person.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())
    elif eketype == "organ":
        field = [ [str(obj.id), str(obj.name)] for obj in list(organ.objects.all()) ]
        field.sort(key=lambda x: x[1].lower())
    elif eketype == "fundedsite":
        field = [ [str(obj.id), str(obj.id)] for obj in list(fundedsite.objects.all()) ]
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

def clean_unicode_str(obj):
    if isinstance(obj, basestring):
        return obj.encode('ascii', 'ignore')
    else:
        return obj
