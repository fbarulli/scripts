#!/bin/bash

echo "Installing Docker..."
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg

# Add Docker's official GPG key (force overwrite if needed)
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/docker-archive-keyring.gpg

# Use Debian's repository (not Ubuntu) - Fallback to "bullseye" if "bookworm" is unsupported
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Ensure the 'docker' group exists
sudo groupadd --force docker
sudo usermod -aG docker $USER

echo "Docker installed. Log out and back in or run 'newgrp docker' to apply changes."
