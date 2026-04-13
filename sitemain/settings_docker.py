import datetime
import os

from django.db.backends.postgresql import utils as postgresql_utils
from django.utils.timezone import utc


def _patched_utc_tzinfo_factory(offset):
    # Django 1.9 expects an integer offset, but newer psycopg2 releases hand
    # back a zero timedelta for UTC connections.
    if isinstance(offset, datetime.timedelta):
        offset = int(offset.total_seconds() // 60)
    if offset != 0:
        raise AssertionError("database connection isn't set to UTC")
    return utc


postgresql_utils.utc_tzinfo_factory = _patched_utc_tzinfo_factory

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

RDF_URL = os.environ.get("RDF_URL", "http://localhost:8000/")
MCL_URL = os.environ.get("MCL_URL", "http://localhost:8000/")

SECRET_KEY = os.environ.get("DJANGO_SECRET_KEY", "ksdb-local-dev-secret-key")

DEBUG = os.environ.get("DJANGO_DEBUG", "1").lower() in ("1", "true", "yes", "on")

ALLOWED_HOSTS = [
    host.strip()
    for host in os.environ.get("DJANGO_ALLOWED_HOSTS", "*").split(",")
    if host.strip()
]

INSTALLED_APPS = (
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "ksdb",
)

MIDDLEWARE_CLASSES = (
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.auth.middleware.SessionAuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "django.middleware.security.SecurityMiddleware",
)

ROOT_URLCONF = "sitemain.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [os.path.join(BASE_DIR, "templates")],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "sitemain.wsgi_docker.application"

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": os.environ.get("DATABASE_NAME", "ksdb"),
        "USER": os.environ.get("DATABASE_USER", "ksdb"),
        "PASSWORD": os.environ.get("DATABASE_PASSWORD", "ksdb"),
        "HOST": os.environ.get("DATABASE_HOST", "db"),
        "PORT": os.environ.get("DATABASE_PORT", "5432"),
    }
}

LANGUAGE_CODE = "en-us"
TIME_ZONE = "UTC"
USE_I18N = True
USE_L10N = True
USE_TZ = True

STATIC_URL = "/static/"
STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")

LOGIN_REDIRECT_URL = "/ksdb/view/"

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "simple": {
            "format": "%(levelname)s %(name)s %(message)s",
        },
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "simple",
        },
    },
    "root": {
        "handlers": ["console"],
        "level": "INFO",
    },
    "loggers": {
        "django": {
            "handlers": ["console"],
            "level": "INFO",
            "propagate": False,
        },
        "ksdb": {
            "handlers": ["console"],
            "level": "INFO",
            "propagate": False,
        },
    },
}
