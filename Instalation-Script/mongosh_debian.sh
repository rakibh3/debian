#!/bin/bash

sudo nala install gnupg curl

# Import the MongoDB GPG key
#curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
 #  sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
  # --dearmor

curl -fsSL https://pgp.mongodb.com/server-7.0.asc |sudo gpg  --dearmor -o /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg


# Create a list file for MongoDB
#echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update the package list
sudo nala update

# Install the MongoDB shell
sudo nala install -y mongodb-org
