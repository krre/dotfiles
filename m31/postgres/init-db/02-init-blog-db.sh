#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER blog WITH PASSWORD '$BLOG_PASSWORD';
	CREATE DATABASE blog OWNER=blog;
EOSQL
