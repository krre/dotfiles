#!/bin/bash

DB_NAME=$1

if [ -z "$DB_NAME" ]; then
    echo "Usage: $0 <database_name>"
    exit 1
fi

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
BACKUP_DIR="$SCRIPT_DIR/$DB_NAME/backups"
mkdir -p "$BACKUP_DIR"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
DB_CONTAINER="postgres"
DB_USER="postgres"

set -o pipefail

docker exec $DB_CONTAINER pg_dump -U $DB_USER "$DB_NAME" | gzip -9 > "$BACKUP_DIR/$DB_NAME.$DATE.sql.gz"

if [ $? -eq 0 ]; then
    echo "[$DATE] Backup for '$DB_NAME' successful"
else
    echo "[$DATE] Backup for '$DB_NAME' failed" >&2
    exit 1
fi

find "$BACKUP_DIR" -type f -mtime +10 -name "$DB_NAME.*.sql.gz" -delete
