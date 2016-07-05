# -*- coding: utf-8 -*-

from django.forms import ModelForm
from models import protocol, person, project, institution, publication, fundedsite

class ProtocolForm(ModelForm):
    class Meta:
        model = protocol
        fields = '__all__'

class PersonForm(ModelForm):
    class Meta:
        model = person
        fields = '__all__'

class ProjectForm(ModelForm):
    class Meta:
        model = project
        fields = '__all__'

class InstitutionForm(ModelForm):
    class Meta:
        model = institution
        fields = '__all__'

class PublicationForm(ModelForm):
    class Meta:
        model = publication
        fields = '__all__'

class FundedsiteForm(ModelForm):
    class Meta:
        model = fundedsite
        fields = '__all__'
