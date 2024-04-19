#!/usr/bin/env bash
set -e

root="/docker-entrypoint-initdb.d"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a <<-EOSQL
  CREATE SCHEMA IF NOT EXISTS "$POSTGRES_SCHEMA" AUTHORIZATION "$POSTGRES_USER";
EOSQL

PGOPTIONS="--search_path=$POSTGRES_SCHEMA" psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f "$root/schema.sql.template"
