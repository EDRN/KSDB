#!/bin/sh
set -eu

cp /app/sitemain/settings_docker.py /app/sitemain/settings.py
cp /app/sitemain/wsgi_docker.py /app/sitemain/wsgi.py

exec "$@"
