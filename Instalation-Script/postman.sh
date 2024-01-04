#!/bin/bash

# Ensure script is run with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

username=$(id -u -n 1000)

# Check if the Postman archive exists in Downloads
if [[ ! -f /home/$username/Downloads/Postman-linux-x64.tar.gz ]]; then
  echo "Postman archive not found in Downloads. Please download and place it there."
  exit 1
fi

# Create the installation directory
mkdir -p /opt/apps/

# Extract the archive
tar -xzf /home/$username/Downloads/Postman-linux-x64.tar.gz -C /opt/apps/

# Create a symbolic link for convenient access
ln -s /opt/apps/Postman/Postman /usr/local/bin/postman

# Create the desktop entry for easy launching
cat << EOF > /usr/share/applications/postman.desktop
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/apps/Postman/app/resources/app/assets/icon.png
Exec="/opt/apps/Postman/Postman"
Comment=Postman Desktop App
Categories=Development;Code;
EOF

# Check if Postman launches successfully
postman || echo "Postman launch failed. Please check installation."
