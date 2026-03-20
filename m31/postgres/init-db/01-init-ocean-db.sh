#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER ocean WITH PASSWORD '$OCEAN_PASSWORD';
	CREATE DATABASE ocean OWNER=ocean;
EOSQL
