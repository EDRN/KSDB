# publications.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import simplejson
import copy

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import publication, publication_author_link, person

# Allow external command processing
from django.http import JsonResponse
from ksdb.forms import PublicationForm

#import settings
import logging
logger = logging.getLogger(__name__)

def save_publication_links(pub_id, request):
    #delete and save new person publication associations
    authorlist = request.POST.getlist('authors')
    publication_author_link.objects.filter(publicationid=pub_id).delete()
    for per in authorlist:
        publication_author_linkm = publication_author_link(publicationid = pub_id, personid = per)
        publication_author_linkm.save()

def gen_publication_data(request):
    personfield = [ [str(obj.id), str(obj.firstname), str(obj.lastname)] for obj in list(person.objects.all()) ]
    personfield.sort(key=lambda x: x[1].lower())
    data = {"action" : "New" ,
            "authors" : personfield ,
           }
    if request.method == 'GET':
        publicationid = request.GET.get('id')
        if publicationid:
            obj = publication.objects.get(pk=int(publicationid))
            data = { "action" : "Edit",
                    "id" : obj.id,
                    "title" : obj.title,
                    "journal" : obj.journal,
                    "pubmedid" : obj.pubmedid,
                    "pubyear" : str(obj.pubyear),
                    "author_link_id" : [ ppl.personid for ppl in list(publication_author_link.objects.filter(publicationid=int(publicationid))) ],
                    "authors" : personfield ,
                   }

    return data

def delete_publication(request):
    message = None
    success = False

    if request.method == 'POST':
        ids = request.POST.get("id").split(",")
        if len(ids) > 0:
            for pub_id in ids:
                #delete author publication associations
                publication_author_link.objects.filter(publicationid=pub_id).delete()
                #delete publication itself
                publication.objects.filter(id=pub_id).delete()

            message = "Successfully deleted publication id(s): "+request.POST.get("id")
            success = True
        else:
            success = False
            message = "No publications selected, please select publication for deletion."
    else:
        message = "Not a post method, has to be post in order to delete object."
    return JsonResponse({'Success':success,
                                'Message':message})

def publication_input(request):
    if request.method == 'POST':

        pub_id = None
        message = "You have successfully added a publication."
        success = True
        parameters = copy.copy(request.POST)
        if request.POST.get('action') == "edit":
            pub_id = int(request.POST.get('publicationid'))
            message = "You have successfull edited publication "+str(pub_id)+"."
            parameters["id"] = pub_id
            publicationi = publication.objects.get(id=pub_id)
            publicationm = PublicationForm(parameters or None, instance=publicationi)
        else:
            pub_id = IdSeq.objects.raw("select sequence_name, nextval('publication_seq') from publication_seq")[0].nextval
            parameters["id"] = pub_id
            publicationm = PublicationForm(parameters)
        
        if publicationm.is_valid():
            publicationm.save()

            #save publication data into db
            save_publication_links(pub_id, request)
        else:
            message = simplejson.dumps(publicationm.errors)
            success = False

        return JsonResponse({'Success':success,
                            'Message':message})

    #generate publication data from db
    data = gen_publication_data(request)

    # Render input page with the documents and the form
    return render_to_response(
        'publicationinput.html',
        data,
        context_instance=RequestContext(request)
    )
