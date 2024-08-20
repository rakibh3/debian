#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update && apt upgrade -y
sudo apt install nala

# Install common dependencies
echo "Installing common packages..."
sudo nala install -y \
    curl \
    wget \
    gpg \
    gnupg \
    apt-transport-https \
    ca-certificates \
    git

echo "Common packages installation complete."
