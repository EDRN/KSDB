FROM python:3.7-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY requirements-docker.txt /app/requirements-docker.txt
RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r /app/requirements-docker.txt

COPY . /app
COPY docker/entrypoint.sh /usr/local/bin/ksdb-entrypoint
RUN chmod +x /usr/local/bin/ksdb-entrypoint

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/ksdb-entrypoint"]
CMD ["gunicorn", "sitemain.wsgi_docker:application", "--bind", "0.0.0.0:8000", "--workers", "2"]
