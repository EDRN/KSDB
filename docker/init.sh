#!/bin/sh
set -eu

python - <<'PY'
import os
import time

import psycopg2

settings = {
    "dbname": os.environ.get("DATABASE_NAME", "ksdb"),
    "user": os.environ.get("DATABASE_USER", "ksdb"),
    "password": os.environ.get("DATABASE_PASSWORD", "ksdb"),
    "host": os.environ.get("DATABASE_HOST", "db"),
    "port": os.environ.get("DATABASE_PORT", "5432"),
}

for attempt in range(60):
    try:
        connection = psycopg2.connect(**settings)
    except Exception as exc:
        print("Waiting for database ({}/60): {}".format(attempt + 1, exc))
        time.sleep(2)
    else:
        connection.close()
        print("Database is ready.")
        break
else:
    raise SystemExit("Database never became ready.")
PY

python manage.py migrate --noinput --run-syncdb

case "${KSDB_PRELOAD_DATA:-1}" in
  1|true|TRUE|yes|YES|on|ON)
    python manage.py preloadksdbdata
    ;;
esac

python manage.py collectstatic --noinput

if [ -n "${DJANGO_SUPERUSER_USERNAME:-}" ] && [ -n "${DJANGO_SUPERUSER_PASSWORD:-}" ]; then
python - <<'PY'
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", os.environ.get("DJANGO_SETTINGS_MODULE", "sitemain.settings_docker"))

import django

django.setup()

from django.contrib.auth import get_user_model

User = get_user_model()
username = os.environ["DJANGO_SUPERUSER_USERNAME"]
email = os.environ.get("DJANGO_SUPERUSER_EMAIL", "")
password = os.environ["DJANGO_SUPERUSER_PASSWORD"]

user, created = User.objects.get_or_create(
    username=username,
    defaults={"email": email, "is_staff": True, "is_superuser": True},
)
user.email = email
user.is_staff = True
user.is_superuser = True
user.set_password(password)
user.save()

print("{} Django superuser '{}'.".format("Created" if created else "Updated", username))
PY
fi
