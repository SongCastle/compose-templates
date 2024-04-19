#!/usr/bin/env bash
set -e

# Export `DATABASE_URL` for Prisma
password() {
  local var="$1"
  local fileVar="${var}_FILE"
  val="$(< "${!fileVar}")"
  echo "$val"
}

pw=`password 'POSTGRES_PASSWORD'`
export DATABASE_URL="postgresql://$POSTGRES_USER:$pw@$DB_HOST:$POSTGRES_PORT/$POSTGRES_DB?schema=$POSTGRES_SCHEMA&connection_limit=5"

# Run command with node if the first argument contains a "-" or is not a system command. The last
# part inside the "{}" is a workaround for the following bug in ash/dash:
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=874264
if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  set -- node "$@"
fi

exec "$@"
