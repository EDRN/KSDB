# -*- coding: utf-8 -*-
from django.contrib.auth.forms import AuthenticationForm 
from django import forms
from ksdb.models import protocol, person, program, institution, publication, fundedsite, organ, degree, group, disease


class ProtocolForm(forms.ModelForm):
    class Meta:
        model = protocol
        fields = '__all__'

class PersonForm(forms.ModelForm):
    class Meta:
        model = person
        fields = '__all__'

class ProgramForm(forms.ModelForm):
    class Meta:
        model = program
        fields = '__all__'

class InstitutionForm(forms.ModelForm):
    class Meta:
        model = institution
        fields = '__all__'

class PublicationForm(forms.ModelForm):
    class Meta:
        model = publication
        fields = '__all__'

class FundedsiteForm(forms.ModelForm):
    class Meta:
        model = fundedsite
        fields = '__all__'

class DegreeForm(forms.ModelForm):
    class Meta:
        model = degree
        fields = '__all__'

class OrganForm(forms.ModelForm):
    class Meta:
        model = organ
        fields = '__all__'

class DiseaseForm(forms.ModelForm):
    class Meta:
        model = disease
        fields = '__all__'

class GroupForm(forms.ModelForm):
    class Meta:
        model = group
        fields = '__all__'

class LoginForm(AuthenticationForm):
    username = forms.CharField(label="Username", max_length=30, 
                               widget=forms.TextInput(attrs={'class': 'form-control', 'name': 'username'}))
    password = forms.CharField(label="Password", max_length=30, 
                               widget=forms.PasswordInput(attrs={'class': 'form-control', 'name': 'password'}))
