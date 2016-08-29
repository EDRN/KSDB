from django.views.generic.edit import CreateView
from django.shortcuts import render
from ksdb.models import person
 
def ModalView(request):
    return render(request, 'modalview.html', {'news': 'OK'})
