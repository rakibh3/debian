#!/bin/bash

# Ensure script is run with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Check if the Postman archive exists in Downloads
if [[ ! -f ~/Downloads/Postman-linux-x64-7.32.0.tar.gz ]]; then
  echo "Postman archive not found in Downloads. Please download and place it there."
  exit 1
fi

# Create the installation directory
mkdir -p /opt/apps/

# Extract the archive
tar -xzf ~/Downloads/Postman-linux-x64-7.32.0.tar.gz -C /opt/apps/

# Move the extracted Postman directory to the installation directory
mv /opt/apps/Postman-linux-x64-7.32.0 /opt/apps/Postman

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
