from django.conf.urls import include, url
from django.contrib import admin
from django.views.static import serve
from sitemain import settings

urlpatterns = [
	url(r'^ksdb/', include('ksdb.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^static/(?P<path>.*)$', serve, {'document_root': settings.STATIC_ROOT, }),
]
