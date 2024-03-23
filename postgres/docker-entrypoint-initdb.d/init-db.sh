#!/bin/ash
set -e

# psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "postgres" -a <<-EOSQL
#   CREATE DATABASE "$POSTGRES_DB" WITH ENCODING 'UTF8' LC_COLLATE 'ja_JP.UTF-8' LC_CTYPE 'ja_JP.UTF-8' TEMPLATE 'template0';
# EOSQL

root="/docker-entrypoint-initdb.d"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a <<-EOSQL
  CREATE SCHEMA IF NOT EXISTS "$POSTGRES_SCHEMA" AUTHORIZATION "$POSTGRES_USER";
EOSQL

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f "$root/schema.sql.template"
PGOPTIONS="--search_path=$POSTGRES_SCHEMA" psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f "$root/schema.sql.template"
