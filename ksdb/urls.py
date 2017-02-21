# app/urls.py

from django.conf.urls import url

from ksdb import protocols, program, person, institution, publication, fundedsite, group, view, organ, disease, degree, querypubmed, publishRDF, ingestRDF, ModalView, ekeutils, ksdbviews
from sitemain import settings

urlpatterns = [
    url(r'^protocolinput/$', protocols.protocol_input, name='protocolinput'),
    url(r'^personinput/$', person.person_input, name='personinput'),
    url(r'^view/$', view.view_service, name='view'),
    url(r'^programinput/$', program.program_input, name='programinput'),
    url(r'^institutioninput/$', institution.institution_input, name='institutioninput'),
    url(r'^publicationinput/$', publication.publication_input, name='publicationinput'),
    url(r'^fundedsiteinput/$', fundedsite.fundedsite_input, name='fundedsiteinput'),
    url(r'^groupinput/$', group.group_input, name='groupinput'),
    url(r'^organinput/$', organ.organ_input, name='organinput'),
    url(r'^diseaseinput/$', disease.disease_input, name='diseaseinput'),
    url(r'^degreeinput/$', degree.degree_input, name='degreeinput'),
    url(r'^querypubmed/$', querypubmed.pubmed_query, name='querypubmed'),
    url(r'^publishrdf/$', publishRDF.publishrdf, name='publishrdf'),
    url(r'^ingestrdf/$', ingestRDF.ingestrdf, name='ingestrdf'),
    url(r'^deleteprotocol/$', protocols.delete_protocol, name='deleteprotocol'),
    url(r'^deleteprogram/$', program.delete_program, name='deleteprogram'),
    url(r'^deleteinstitution/$', institution.delete_institution, name='deleteinstitution'),
    url(r'^deletefundedsite/$', fundedsite.delete_fundedsite, name='deletefundedsite'),
    url(r'^deletegroup/$', group.delete_group, name='deletegroup'),
    url(r'^deleteperson/$', person.delete_person, name='deleteperson'),
    url(r'^deletepublication/$', publication.delete_publication, name='deletepublication'),
    url(r'^deleteorgan/$', organ.delete_organ, name='deleteorgan'),
    url(r'^deletedisease/$', disease.delete_disease, name='deletedisease'),
    url(r'^deletedegree/$', degree.delete_degree, name='deletedegree'),
    url(r'^modalview/$', ModalView.ModalView, name='modal-view'),
    url(r'^ekeapi/$', ekeutils.eke_api, name='eke-api'),
    url(r'^personview/$', ksdbviews.PersonView.as_view(), name='personview'),
    url(r'^publicationview/$', ksdbviews.PublicationView.as_view(), name='publicationview'),
    url(r'^programview/$', ksdbviews.ProgramView.as_view(), name='programview'),
    url(r'^institutionview/$', ksdbviews.InstitutionView.as_view(), name='institutionview'),
    url(r'^fundedsiteview/$', ksdbviews.FundedSiteView.as_view(), name='fundedsiteview'),
    url(r'^groupview/$', ksdbviews.GroupView.as_view(), name='groupview'),
    url(r'^protocolview/$', ksdbviews.ProtocolView.as_view(), name='protocolview'),
    url(r'^organview/$', ksdbviews.OrganView.as_view(), name='organview'),
    url(r'^diseaseview/$', ksdbviews.DiseaseView.as_view(), name='diseaseview'),
    url(r'^degreeview/$', ksdbviews.DegreeView.as_view(), name='degreeview'),
]
