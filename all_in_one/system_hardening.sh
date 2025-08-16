#!/bin/bash
# Complete system hardening script

# ************************
# 1. Auto updates
# ************************
echo "[*] Setting up auto-updates..."
sudo apt update -y # System update before any changes
sudo apt install -y unattended-upgrades # For auto update setting
sudo dpkg-reconfigure --priority=low unattended-upgrades

# ************************
# 2. Firewall
# ************************
echo "[*] Configuring firewall..."
sudo ufw default deny incoming # Default door lock, onlu you can enter with credenticals 
sudo ufw default allow outgoing # You can use Internet
sudo ufw allow OpenSSH # Auto detects ssh port
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 23/tcp # Good to deactivate, insecure port
sudo ufw enable --force

# ************************
# 3. Sensitive file permissions
# ************************
echo "[*] Securing sensitive files..."
sudo chmod 600 /etc/shadow
sudo chmod 644 /etc/passwd

# ************************
# 4. Extra hardening
# ************************
echo "[*] Disabling root login over SSH..."
# Prevents anyone from logging in directly as root via SSH
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config 
sudo systemctl restart sshd

echo "[*] Cleaning up unused packages..."
# Reduces potential attack surface and frees up disk space
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "[*] Security hardening complete!"
