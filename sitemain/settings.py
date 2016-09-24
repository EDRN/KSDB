# Build paths inside the mabproj like this: os.path.join(BASE_DIR, ...)
import os
import ldap
from django_auth_ldap.config import LDAPSearch, GroupOfNamesType

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


#LDAP Configurations
# Baseline configuration.
AUTH_LDAP_SERVER_URI = ""

AUTH_LDAP_BIND_DN = "[AUTH_LDAP_BIND_DN]"
AUTH_LDAP_BIND_PASSWORD = "[AUTH_LDAP_BIND_PASSWORD]"
AUTH_LDAP_USER_SEARCH = LDAPSearch("[AUTH_LDAP_USER_SEARCH]",
    ldap.SCOPE_ONELEVEL, '(uid=%(user)s)')

AUTH_LDAP_GROUP_SEARCH = LDAPSearch("[AUTH_LDAP_GROUP_SEARCH]",
    ldap.SCOPE_ONELEVEL, "(objectClass=groupOfUniqueNames)")
AUTH_LDAP_GROUP_TYPE = GroupOfNamesType(name_attr="cn")

# Cache group memberships for an hour to minimize LDAP traffic
AUTH_LDAP_CACHE_GROUPS = True
AUTH_LDAP_GROUP_CACHE_TIMEOUT = 3600

# Keep ModelBackend around for per-user permissions and maybe a local
# superuser.
AUTHENTICATION_BACKENDS = (
    'django_auth_ldap.backend.LDAPBackend',
    'django.contrib.auth.backends.ModelBackend',
)
#LDAP Configurations end

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '[SECRET_KEY]'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Application definition
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'ksdb',
    'django_nose',
    'tinymce',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

ROOT_URLCONF = 'sitemain.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'sitemain.wsgi.application'

# Database
DATABASES = {
    'default': {
        'ENGINE': '[ENGINE]',
        'NAME': '[NAME]',
        'USER': '[USER]',
        'PASSWORD': '[PASSWORD]',
        'HOST': '[HOST]',
        'PORT': '',
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True


# ESIS Settings
ESIS_ROOT    = os.path.join(BASE_DIR, 'ksdb')
STATIC_URL  = '/static/'
STATIC_ROOT = os.path.join(ESIS_ROOT, 'static')

# Static settings
#STATICFILES_DIRS = [
#    os.path.join(ESIS_ROOT, 'static'),
#]

#Login settings
LOGIN_REDIRECT_URL = '/' # It means home view

TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'

# Logging Settings
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format' : "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt' : "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'mysite.log',
            'formatter': 'verbose'
        },
    },
    'loggers': {
        'django': {
            'handlers':['file'],
            'propagate': True,
            'level':'DEBUG',
        },
        'ksdb': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
    }
}
