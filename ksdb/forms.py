# -*- coding: utf-8 -*-

from django.forms import ModelForm
from models import protocol

class ProtocolForm(ModelForm):
    class Meta:
        model = protocol
        fields = '__all__'
