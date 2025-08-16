#!/bin/bash
# UFW firewall hardening

echo "[*] Setting UFW default policies..."
sudo ufw default deny incoming  # Default door lock, onlu you can enter with credenticals 
sudo ufw default allow outgoing  # You can use Internet

echo "[*] Allowing essential services..."
sudo ufw allow OpenSSH # Auto detects ssh port
sudo ufw allow 80/tcp # HTTP
sudo ufw allow 443/tcp # HTTPS
sudo ufw deny 23/tcp # Good to deactivate Telnet, insecure port

echo "[*] Enabling UFW..."
sudo ufw enable --force

echo "[*] Firewall configured successfully!"
