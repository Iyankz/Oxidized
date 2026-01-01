# 🚀 Oxidized Auto Installer (Debian Based)

Oxidized adalah tool backup konfigurasi perangkat jaringan yang ringan dan fleksibel. Tool ini merupakan alternatif modern untuk menggantikan RANCID! Project ini menyediakan automasi instalasi penuh khusus untuk sistem berbasis Debian (Ubuntu, Debian, Proxmox).

## 📂 Struktur Project
```text
.
├── install.sh              # Script utama instalasi otomatis
├── README.md               # Dokumentasi project
├── .gitignore              # Aturan pengabaian file Git
└── templates/              # Template konfigurasi default
    ├── config.yaml         # Konfigurasi utama Oxidized
    ├── router.db           # Daftar perangkat (Multi-vendor)
    └── oxidized.service    # Unit layanan Systemd
```
## Persyaratan
* Ubuntu / Debian based Linux.
* Akses `sudo` atau root.

## 🛠️ Cara Instalasi Cepat
Cukup jalankan satu perintah ini di terminal server Anda:

```bash

sudo curl -sSL https://github.com/Iyankz/Oxidized/blob/main/install.sh | sudo bash
```
## ✨ Fitur Utama
* Otomatisasi Waktu: Mengatur timezone ke Asia/Jakarta.
* Dukungan Multi-Vendor: Siap digunakan untuk Cisco, Mikrotik, Juniper, HP, Ubiquiti, dan banyak lagi.
* Integrasi Git: Melacak setiap perubahan konfigurasi secara otomatis menggunakan Git.
* Web UI & API: Pantau status backup melalui browser di port 8888.
* Systemd Integration: Oxidized otomatis berjalan saat server dinyalakan.

## ⚙️ Konfigurasi Lanjutan
Setelah instalasi selesai, Anda dapat menyesuaikan daftar perangkat di: /home/oxidized/.config/oxidized/router.db atau di : root/oxidized/.config/oxidized/router.db

Dan mengubah konfigurasi utama di: /home/oxidized/.config/oxidized/config atau di : /root/oxidized/.config/oxidized/config

## 📡 Contoh Penambahan Perangkat
Edit file router.db dengan format Nama/IP:Model:Grup:
```text
192.168.1.1:ios:core_sw        # Untuk Cisco
192.168.1.2:routeros:gateway   # Untuk Mikrotik
192.168.1.3:junos:edge_router  # Untuk Juniper
