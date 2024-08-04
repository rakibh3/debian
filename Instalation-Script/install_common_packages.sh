#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update && apt upgrade -y

sudo apt install nala

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo nala upgrade -y

# Install common dependencies
echo "Installing common packages..."
sudo nala install -y \
    curl \
    wget \
    gpg \
    gnupg \
    apt-transport-https \
    ca-certificates \
    gnome-software-plugin-flatpak \
    flatpak \
    nala \
    git

echo "Common packages installation complete."
