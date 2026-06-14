#!/usr/bin/env bash
set -e

APP_NAME="SLEMP"
AUTHOR="Darmawan Kunto. W"
PORT="12345"

GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

clear
echo -e "${BLUE}"
echo "======================================"
echo "        SLEMP PROFESSIONAL INSTALLER"
echo "        Simple Linux Engine-X"
echo "        by $AUTHOR"
echo "======================================"
echo -e "${RESET}"

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Jalankan sebagai root.${RESET}"
  echo "Gunakan:"
  echo "sudo bash slemp.sh"
  exit 1
fi

echo -e "${GREEN}[1/7] Mengecek sistem...${RESET}"
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$ID
else
  echo -e "${RED}OS tidak dikenali.${RESET}"
  exit 1
fi

echo "OS terdeteksi: $PRETTY_NAME"

echo -e "${GREEN}[2/7] Update repository...${RESET}"
if command -v apt >/dev/null 2>&1; then
  apt update -y
  PKG="apt install -y"
elif command -v dnf >/dev/null 2>&1; then
  dnf update -y
  PKG="dnf install -y"
elif command -v yum >/dev/null 2>&1; then
  yum update -y
  PKG="yum install -y"
else
  echo -e "${RED}Package manager tidak didukung.${RESET}"
  exit 1
fi

echo -e "${GREEN}[3/7] Install Nginx, MariaDB, PHP-FPM...${RESET}"
$PKG nginx mariadb-server php-fpm curl wget unzip

echo -e "${GREEN}[4/7] Menyalakan service...${RESET}"
systemctl enable nginx || true
systemctl enable mariadb || true
systemctl enable php-fpm || true
systemctl restart nginx || true
systemctl restart mariadb || true
systemctl restart php-fpm || true

echo -e "${GREEN}[5/7] Membuat halaman dashboard SLEMP...${RESET}"
mkdir -p /var/www/slemp

cat > /var/www/slemp/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>SLEMP Dashboard</title>
  <style>
    body {
      margin:0;
      font-family:Arial,sans-serif;
      background:#020617;
      color:#e5e7eb;
      display:flex;
      justify-content:center;
      align-items:center;
      height:100vh;
    }
    .card {
      background:#0f172a;
      padding:40px;
      border-radius:20px;
      width:520px;
      box-shadow:0 20px 60px rgba(0,0,0,.5);
      border:1px solid #1e293b;
    }
    h1 { color:#38bdf8; margin:0; }
    p { color:#94a3b8; }
    .status {
      margin-top:25px;
      padding:15px;
      background:#022c22;
      color:#86efac;
      border-radius:12px;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>SLEMP</h1>
    <p>Simple Linux Engine-X Monitoring Platform</p>
    <div class="status">Status: Running Successfully</div>
    <p>Installed by Darmawan Kunto. W</p>
  </div>
</body>
</html>
EOF

echo -e "${GREEN}[6/7] Konfigurasi Nginx...${RESET}"
cat > /etc/nginx/conf.d/slemp.conf <<EOF
server {
    listen $PORT;
    server_name _;
    root /var/www/slemp;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

nginx -t
systemctl restart nginx

echo -e "${GREEN}[7/7] Konfigurasi firewall jika tersedia...${RESET}"
if command -v ufw >/dev/null 2>&1; then
  ufw allow $PORT/tcp || true
fi

if command -v firewall-cmd >/dev/null 2>&1; then
  firewall-cmd --permanent --add-port=$PORT/tcp || true
  firewall-cmd --reload || true
fi

IP=$(hostname -I | awk '{print $1}')

echo -e "${GREEN}"
echo "======================================"
echo "        INSTALLASI SLEMP SELESAI"
echo "======================================"
echo -e "${RESET}"
echo "Akses:"
echo "http://$IP:$PORT"
echo ""
echo "Service:"
echo "Nginx     : systemctl status nginx"
echo "MariaDB   : systemctl status mariadb"
echo "PHP-FPM   : systemctl status php-fpm"
echo ""
echo "Terima kasih sudah menggunakan SLEMP."
