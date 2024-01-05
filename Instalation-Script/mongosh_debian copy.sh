#!/bin/bash

sudo apt-get install gnupg curl

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get update

#sudo nala install -y mongodb-mongosh-shared-openssl3

sudo apt-get install -y mongodb-org

# sudo systemctl start mongod
# sudo systemctl daemon-reload
# sudo systemctl status mongod
# sudo systemctl enable mongod
# mongosh
