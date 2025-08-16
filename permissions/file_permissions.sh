#!/bin/bash
# Sensitive file permissions hardening

echo "[*] Securing sensitive files..."

# Shadow file should be readable only by root
sudo chmod 600 /etc/shadow

# Passwd file default
sudo chmod 644 /etc/passwd

echo "[*] Sensitive file permissions set successfully!"
