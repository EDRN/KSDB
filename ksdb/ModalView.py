from django.views.generic.edit import CreateView
from django.shortcuts import render
from models import person
 
def ModalView(request):
    return render(request, 'modalview.html', {'news': 'OK'})
