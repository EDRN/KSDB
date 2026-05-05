FROM python:3.7-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements-docker.txt /app/requirements-docker.txt
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential ca-certificates \
    && pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r /app/requirements-docker.txt \
    && apt-get purge -y --auto-remove build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
COPY docker/entrypoint.sh /usr/local/bin/ksdb-entrypoint
COPY docker/init.sh /usr/local/bin/ksdb-init
RUN chmod +x /usr/local/bin/ksdb-entrypoint /usr/local/bin/ksdb-init

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/ksdb-entrypoint"]
CMD ["gunicorn", "sitemain.wsgi_docker:application", "--bind", "0.0.0.0:8000", "--workers", "2"]
