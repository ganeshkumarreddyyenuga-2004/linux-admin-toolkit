#!/bin/bash

set -euo pipefail

SOURCE_DIR="${1:-$HOME/linux-admin-toolkit}"
BACKUP_DIR="$HOME/linux-admin-toolkit/backups"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: Source directory not found"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/backup_$(date +%F_%H-%M-%S).tar.gz"

tar -czf "$BACKUP_FILE" \
    --exclude="$SOURCE_DIR/backups" \
    --exclude="$SOURCE_DIR/.git" \
    -C "$(dirname "$SOURCE_DIR")" \
    "$(basename "$SOURCE_DIR")"

tar -tzf "$BACKUP_FILE" >/dev/null

echo "Backup created successfully"
echo "$BACKUP_FILE"
echo "Archive verification successful"
