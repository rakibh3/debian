#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update && apt upgrade -y
sudo apt install nala

# Update package lists with nala
echo "Updating package lists with nala..."
sudo nala update && mala upgrade -y

# Install common dependencies
echo "Installing common packages..."
sudo nala install -y \
    curl \
    wget \
    gpg \
    gnupg \
    apt-transport-https \
    ca-certificates \
    nala \
    git

echo "Common packages installation complete."
