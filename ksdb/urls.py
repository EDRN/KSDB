# app/urls.py

from django.conf.urls import url

from ksdb import protocols, project, person, institution, publication, fundedsite, view, organ, degree, querypubmed, publishRDF, ingestRDF, ModalView, ekeutils
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
    url(r'^ingestrdf/$', ingestRDF.ingestrdf, name='ingestrdf'),
    url(r'^deleteprotocol/$', protocols.delete_protocol, name='deleteprotocol'),
    url(r'^deleteproject/$', project.delete_project, name='deleteproject'),
    url(r'^deleteinstitution/$', institution.delete_institution, name='deleteinstitution'),
    url(r'^deletefundedsite/$', fundedsite.delete_fundedsite, name='deletefundedsite'),
    url(r'^deleteperson/$', person.delete_person, name='deleteperson'),
    url(r'^deletepublication/$', publication.delete_publication, name='deletepublication'),
    url(r'^deleteorgan/$', organ.delete_organ, name='deleteorgan'),
    url(r'^deletedegree/$', degree.delete_degree, name='deletedegree'),
    url(r'^modalview/$', ModalView.ModalView, name='modal-view'),
    url(r'^ekeapi/$', ekeutils.eke_api, name='eke-api'),
]
