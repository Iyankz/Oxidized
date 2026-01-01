#!/bin/bash
# =================================================================
# Project: Universal Oxidized Auto Installer (Debian Based)
# Author: Iyankz (https://github.com/Iyankz)
# =================================================================

# 1. Set Timezone Asia/Jakarta (Mandatory)
timedatectl set-timezone Asia/Jakarta

echo "--- [1/5] Update System & Install Dependensi ---"
# Enable universe if on Ubuntu
if command -v add-apt-repository &> /dev/null; then
    sudo add-apt-repository universe -y
fi

sudo apt update
sudo apt install -y ruby ruby-dev libsqlite3-dev libssl-dev pkg-config cmake \
libssh2-1-dev libicu-dev zlib1g-dev g++ libyaml-dev libzstd-dev git telnet

echo "--- [2/5] Menginstal Oxidized Gems ---"
sudo gem install oxidized oxidized-web oxidized-script

echo "--- [3/5] Setup User & Directory ---"
if ! id "oxidized" &>/dev/null; then
    sudo useradd -s /bin/bash -m oxidized
fi

sudo mkdir -p /home/oxidized/.config/oxidized
sudo mkdir -p /run/oxidized
sudo chown -R oxidized:oxidized /home/oxidized/.config/oxidized
sudo chown oxidized:oxidized /run/oxidized

echo "--- [4/5] Mengunduh Konfigurasi dari Repository Iyankz ---"
# Pastikan URL ini sesuai dengan nama repo Anda nanti
BASE_URL="https://raw.githubusercontent.com/Iyankz/oxidized-auto-install/main/templates"

sudo curl -sSL "${BASE_URL}/config.yaml" -o /home/oxidized/.config/oxidized/config
sudo curl -sSL "${BASE_URL}/router.db" -o /home/oxidized/.config/oxidized/router.db
sudo curl -sSL "${BASE_URL}/oxidized.service" -o /etc/systemd/system/oxidized.service

sudo chown oxidized:oxidized /home/oxidized/.config/oxidized/config
sudo chown oxidized:oxidized /home/oxidized/.config/oxidized/router.db

echo "--- [5/5] Mengaktifkan Oxidized Service ---"
sudo systemctl daemon-reload
sudo systemctl enable oxidized.service
sudo systemctl start oxidized.service

echo "--- INSTALASI SELESAI, IYANKZ! ---"
echo "Web Interface: http://$(hostname -I | awk '{print $1}'):8888"
