#!/bin/bash

# Ensure script is run with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Install Postman (assuming the archive is in Downloads)
username=$(id -u -n 1000)
if [[ ! -f /home/$username/Downloads/Postman-linux-x64.tar.gz ]]; then
  echo "Postman archive not found in Downloads. Please download and place it there."
  exit 1
fi
mkdir -p /opt/apps/
tar -xzf /home/$username/Downloads/Postman-linux-x64.tar.gz -C /opt/apps/
ln -s /opt/apps/Postman/Postman /usr/local/bin/postman
cat << EOF > /usr/share/applications/postman.desktop
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/apps/Postman/app/resources/app/assets/icon.png
Exec="/opt/apps/Postman/Postman"
Comment=Postman Desktop App
Categories=Development;Code;
EOF

postman || echo "Postman launch failed. Please check installation."