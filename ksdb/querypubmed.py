# querypub.py
from Bio import Entrez

# Allow external command processing
from django.http import JsonResponse
from ksdb import ENTREZ_EMAIL

#import settings
import logging
import json
logger = logging.getLogger(__name__)

def pubmed_query(request):
    if request.method == 'GET':
        pubmed_id = request.GET.get('pubmed_id')
        Entrez.email = ENTREZ_EMAIL
        handle = Entrez.efetch(db='pubmed',retmode='xml',rettype='medline',id=pubmed_id)
        records = Entrez.read(handle)
        handle.close()

        pubmed_resp = {}
        if len(records) == 0:
            return JsonResponse({"Success":False, "Message":"No pubmed entries found."})
        if 'MedlineCitation' not in records[0]:
            return JsonResponse({"Success":False, "Message":"No pubmed entries found."})
        if 'Article' not in records[0]['MedlineCitation']:
            return JsonResponse({"Success":False, "Message":"No pubmed entries found."})

        article = records[0]['MedlineCitation']['Article']

        if 'AuthorList' in article:
            authors = []
            for author in article['AuthorList']:
                authors.append(author['ForeName']+" "+author['LastName'])
            pubmed_resp['QueryAuthors'] = ", ".join(authors)
        else:
            pubmed_resp['QueryAuthors'] = "No authors found."

        if 'ArticleTitle' in article:
            pubmed_resp['QueryTitle'] = article['ArticleTitle']
        else:
            pubmed_resp['QueryTitle'] = "No title found."
        
        if 'Abstract' in article:
            if 'AbstractText' in article['Abstract']:
                pubmed_resp['QueryAbstract'] = article['Abstract']['AbstractText']
            else:
                pubmed_resp['QueryAbstract'] = "No abstract found."
        else:
            pubmed_resp['QueryAbstract'] = "No abstract found."
        
        if 'Journal' in article:
            if 'Title' in article['Journal']:
                pubmed_resp['QueryJournal'] = article['Journal']['Title']
            else:
                ubmed_resp['QueryJournal'] = "No journal name found."
        else:
            pubmed_resp['QueryJournal'] = "No journal name found."
        
        if 'ArticleDate' in article:
            if len(article['ArticleDate']) > 0:
                pubmed_resp['QueryArticleDate'] = article['ArticleDate'][0]['Month']+"/"+article['ArticleDate'][0]['Day']+"/"+article['ArticleDate'][0]['Year']
            else:
                pubmed_resp['QueryArticleDate'] = "No article date found."
        else:
            pubmed_resp['QueryArticleDate'] = "No article date found."
        pubmed_resp["Success"] = True
    return JsonResponse(pubmed_resp)
