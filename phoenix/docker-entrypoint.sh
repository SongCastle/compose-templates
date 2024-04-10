#!/usr/bin/env bash
set -e

export_password() {
  local var="$1"
  local fileVar="${var}_FILE"
  val="$(< "${!fileVar}")"
  export "$var"="$val"
}

export_password 'POSTGRES_PASSWORD'

exec "$@"
