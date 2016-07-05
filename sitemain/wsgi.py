"""
WSGI config for demonstration project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os, sys

sys.stderr.write('\n'.join(sys.path))

# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
#
# # add the project path into the sys.path
# sys.path.append(BASE_DIR)
#
# # add the virtualenv site-packages path to the sys.path
# sys.path.append('/home/vagrant/django1.9/lib/python2.7/site-packages')

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sitemain.settings")

application = get_wsgi_application()
