#!/bin/bash
# Complete system hardening script

# ------------------------
# 1. Auto-updates
# ------------------------
echo "[*] Setting up auto-updates..."
sudo apt-get update -y
sudo apt-get install -y unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

# ------------------------
# 2. Firewall
# ------------------------
echo "[*] Configuring firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 23/tcp
sudo ufw enable --force

# ------------------------
# 3. Sensitive file permissions
# ------------------------
echo "[*] Securing sensitive files..."
sudo chmod 600 /etc/shadow
sudo chmod 644 /etc/passwd

# ------------------------
# 4. Extra hardening
# ------------------------
echo "[*] Disabling root login over SSH..."
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "[*] Cleaning up unused packages..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "[*] Security hardening complete!"
