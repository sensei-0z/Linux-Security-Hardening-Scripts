#!/bin/bash
# Sensitive file permissions hardening

echo "[*] Securing sensitive files..."

sudo chmod 600 /etc/shadow # This file should be readable only by root
sudo chmod 644 /etc/passwd # Passwd file default

echo "[*] Sensitive file permissions set successfully!"
