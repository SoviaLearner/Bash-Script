#!/bin/bash

# Monitoring service SSH setiap 10 detik
SERVICE="ssh"

while true; do
    if systemctl is-active --quiet $SERVICE; then
        echo "$(date): Service $SERVICE aktif."
    else
        echo "$(date): *** Peringatan! Service $SERVICE tidak aktif! ***"
    fi
    sleep 10
done
