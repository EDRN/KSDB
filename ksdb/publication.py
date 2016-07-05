# protocols.py
from django.shortcuts import render_to_response
from django.template import RequestContext
import requests

# Create your views here.
from ksdb.models import IdSeq
from ksdb.models import publication, publication_author_link, person

# Allow external command processing
from django.http import JsonResponse

#import settings
import logging
logger = logging.getLogger(__name__)

def publication_input(request):
    if request.method == 'POST':
        title = request.POST.get('publicationtitle')
        pubmedid = request.POST.get('publicationpubid')
        journal = request.POST.get('publicationjournal')
        pubdate = request.POST.get('publicationpubdateinput')
        authorlist = request.POST.getlist('publicationauthor')

        pub_id = None
        message = "You have successfully added a publication."
        if request.POST.get('action') == "edit":
            pub_id = int(request.POST.get('publicationid'))
            message = "You have successfull edited publication "+str(pub_id)+"."
        else:
            pub_id = IdSeq.objects.raw("select sequence_name, nextval('publication_seq') from publication_seq")[0].nextval
        
        publicationm = publication(id = pub_id, 
                            title = title, 
                            authors= ",".join(authorlist), 
                            journal = journal, 
                            pubdate = pubdate,
                            pubmedid = pubmedid
                    )
        publicationm.save()

        #delete and save new person protocol associations
        publication_author_link.objects.filter(publicationid=pub_id).delete()
        for per in authorlist:
            publication_author_linkm = publication_author_link(publicationid = pub_id, personid = per)
            publication_author_linkm.save()

        return JsonResponse({'Success':"True",
                             'errors':'',
                            'Message':message})

    personfield = [ [str(obj.id), str(obj.firstname), str(obj.lastname)] for obj in list(person.objects.all()) ]
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
                    "pubdate" : str(obj.pubdate),
                    "author_link_id" : [ ppl.personid for ppl in list(publication_author_link.objects.filter(publicationid=int(publicationid))) ],
                    "authors" : personfield ,
                   }
    # Render input page with the documents and the form
    return render_to_response(
        'publicationinput.html',
        data,
        context_instance=RequestContext(request)
    )
