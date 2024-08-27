#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Install nala if not already installed
if ! command -v nala &> /dev/null; then
    echo "Installing nala..."
    sudo apt install -y nala
fi

# Use nala to install common dependencies
echo "Installing common packages..."
sudo nala install -y \
    curl \
    wget \
    gpg \
    gnupg \
    apt-transport-https \
    ca-certificates \
    git \
    software-properties-common

echo "Common packages installation complete."
