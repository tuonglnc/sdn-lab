#!/bin/bash

echo "===== SDN LAB ENVIRONMENT SETUP ====="

echo "[1/4] Updating system..."
sudo apt update

echo "[2/4] Installing system packages..."
sudo apt install -y mininet openvswitch-switch python3 python3-pip wireshark git

echo "[3/4] Installing Python dependencies..."
pip3 install -r requirements.txt

echo "[4/4] Adding user to wireshark group..."
sudo usermod -aG wireshark $USER

echo "===== SETUP COMPLETE ====="
echo "Please logout and login again before using Wireshark."
