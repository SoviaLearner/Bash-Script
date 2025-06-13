#!/bin/bash

echo "Step 1: Menampilkan isi file /etc/passwd"
echo "========================================"
cat /etc/passwd

echo
echo "Step 2: Filter baris dengan home directory /home/"
echo "================================================"
grep "/home/" /etc/passwd

echo
echo "Step 3: Filter nama user saja"
echo "============================="
grep "/home/" /etc/passwd | cut -d: -f1
