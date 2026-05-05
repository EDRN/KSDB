#!/bin/sh
set -eu

cleaned_schema="/tmp/ksdb-schema.sql"

awk '
  /^[[:space:]]*#/ { next }
  /CREATE SEQUENCE program_seq START 3;/ { next }
  /alter table fundedsite_project_link rename to fundedsite_program_link;/ { next }
  /alter table project rename to program;/ { next }
  /alter table fundedsite_program_link rename column projectid to programid;/ { next }
  /alter table publication alter column projectid type varchar\(2000\)/ { next }
  /alter table publication add column title type varchar\(2000\)/ { next }
  /alter table publication alter column title type varchar\(2000\)/ {
    print "alter table publication alter column title type varchar(2000);"
    next
  }
  { print }
' /schema/createtables.sql > "${cleaned_schema}"

psql -v ON_ERROR_STOP=0 -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -f "${cleaned_schema}"

