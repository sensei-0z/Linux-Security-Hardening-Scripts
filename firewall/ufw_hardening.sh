#!/bin/bash
# UFW firewall hardening

echo "[*] Setting UFW default policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "[*] Allowing essential services..."
sudo ufw allow OpenSSH       # automatically detects SSH port
sudo ufw allow 80/tcp        # HTTP
sudo ufw allow 443/tcp       # HTTPS
sudo ufw deny 23/tcp         # Telnet

echo "[*] Enabling UFW..."
sudo ufw enable --force

echo "[*] Firewall configured successfully!"
