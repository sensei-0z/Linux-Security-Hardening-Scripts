#!/bin/bash
# Auto-updates script

echo "[*] Updating package lists..."
sudo apt update -y

echo "[*] Installing unattended-upgrades..."
sudo apt install -y unattended-upgrades

echo "[*] Configuring unattended-upgrades..."
sudo dpkg-reconfigure --priority=low unattended-upgrades

echo "[*] Auto-updating system configured successfully!"
