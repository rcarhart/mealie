#!/bin/sh
set -e

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Starting Mealie backup..."

mkdir -p /backups

# backup sqlite database safely
sqlite3 /source/mealie.db ".backup /backups/mealie-db-$DATE.db"

# backup images and uploads
tar -czf /backups/mealie-assets-$DATE.tar.gz -C /source .

# keep only last 14 backups
ls -tp /backups | grep -v '/$' | tail -n +15 | xargs -I {} rm -- /backups/{}

echo "Backup complete"