from django.conf.urls import include, url
from django.contrib import admin
from django.views.static import serve
from sitemain import settings
from ksdb.forms import LoginForm
from ksdb import home
from django.contrib.auth import views

urlpatterns = [
	url(r'^ksdb/', include('ksdb.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^static/(?P<path>.*)$', serve, {'document_root': settings.STATIC_ROOT, }),
    url(r'^login/$', views.login, {'template_name': 'login.html', 'authentication_form': LoginForm}),
    url(r'^logout/$', views.logout, {'next_page': '/login'}), 
    url(r'^$', home.home, name='home'),
]
