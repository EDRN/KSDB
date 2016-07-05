# app/urls.py

from django.conf.urls import url

from ksdb import protocols, project, person, institution, publication, fundedsite, view
from sitemain import settings

urlpatterns = [
    url(r'^protocolinput/$', protocols.protocol_input, name='protocolinput'),
    url(r'^personinput/$', person.person_input, name='personinput'),
    url(r'^view/$', view.view_service, name='view'),
    url(r'^projectinput/$', project.project_input, name='projectinput'),
    url(r'^institutioninput/$', institution.institution_input, name='institutioninput'),
    url(r'^publicationinput/$', publication.publication_input, name='publicationinput'),
    url(r'^fundedsiteinput/$', fundedsite.fundedsite_input, name='fundedsiteinput'),
]
