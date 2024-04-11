#!/usr/bin/env bash
set -e

exec_sql() {
  dbName=$1

  mysql -u 'root' -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
		GRANT ALL ON \`$dbName\`.* TO '$MYSQL_USER'@'%';
	EOSQL
  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -D "$dbName" < '/docker-entrypoint-initdb.d/schema.sql.template'
}

exec_sql "$MYSQL_DATABASE"

if [ ! -z "$MYSQL_CUSTOM_DATABASE" ]; then
  mysql -u 'root' -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
		CREATE DATABASE IF NOT EXISTS \`$MYSQL_CUSTOM_DATABASE\` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
	EOSQL
  exec_sql "$MYSQL_CUSTOM_DATABASE"
fi
