#!/bin/bash

# Direktori yang akan dibackup
SOURCE_DIR="/path/ke/direktori_sumber"

# Direktori tujuan backup
BACKUP_DIR="/path/ke/direktori_backup"

# Pastikan direktori backup ada
mkdir -p "$BACKUP_DIR"

# Counter file backup (1 sampai 10)
COUNTER=1

# Durasi backup dalam detik (1 jam = 3600 detik)
DURATION=3600

# Interval backup dalam detik (15 detik)
INTERVAL=15

START_TIME=$(date +%s)

while true; do
    CURRENT_TIME=$(date +%s)
    ELAPSED=$((CURRENT_TIME - START_TIME))

    if [ $ELAPSED -ge $DURATION ]; then
        echo "Backup selesai setelah 1 jam."
        break
    fi

    BACKUP_FILE="$BACKUP_DIR/backup_file${COUNTER}.tar.gz"

    # Membuat backup dengan tar dan gzip
    tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

    echo "$(date): Backup ke $BACKUP_FILE selesai."

    # Update counter (rotasi 1-10)
    COUNTER=$((COUNTER + 1))
    if [ $COUNTER -gt 10 ]; then
        COUNTER=1
    fi

    sleep $INTERVAL
done
