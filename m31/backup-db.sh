#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" &>/dev/null && pwd)
BACKUP_DIR="$SCRIPT_DIR/ocean/backups"
mkdir -p "$BACKUP_DIR"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
DB_CONTAINER="postgres"
DB_USER="postgres"
DB_NAME="ocean"

docker exec $DB_CONTAINER pg_dump -U $DB_USER $DB_NAME | gzip > "$BACKUP_DIR/dump_$DATE.sql.gz"

find "$BACKUP_DIR" -type f -mtime +30 -name "*.sql.gz" -delete
