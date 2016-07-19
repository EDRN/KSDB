# app/urls.py

from django.conf.urls import url

from ksdb import protocols, project, person, institution, publication, fundedsite, view, organ, degree, querypubmed, publishRDF
from sitemain import settings

urlpatterns = [
    url(r'^protocolinput/$', protocols.protocol_input, name='protocolinput'),
    url(r'^personinput/$', person.person_input, name='personinput'),
    url(r'^view/$', view.view_service, name='view'),
    url(r'^projectinput/$', project.project_input, name='projectinput'),
    url(r'^institutioninput/$', institution.institution_input, name='institutioninput'),
    url(r'^publicationinput/$', publication.publication_input, name='publicationinput'),
    url(r'^fundedsiteinput/$', fundedsite.fundedsite_input, name='fundedsiteinput'),
    url(r'^organinput/$', organ.organ_input, name='organinput'),
    url(r'^degreeinput/$', degree.degree_input, name='degreeinput'),
    url(r'^querypubmed/$', querypubmed.pubmed_query, name='querypubmed'),
    url(r'^publishrdf/$', publishRDF.publishrdf, name='publishrdf'),
]
