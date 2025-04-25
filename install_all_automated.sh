#!/bin/bash

# Exit on error and show commands
set -ex

# --- 1. Install Miniconda (silent, default location) ---
echo "Installing Miniconda..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p "$HOME/miniconda"
rm miniconda.sh

# Initialize conda (silently)
export PATH="$HOME/miniconda/bin:$PATH"
conda init bash > /dev/null 2>&1
source "$HOME/.bashrc"

# --- 2. Install Docker (auto-yes all prompts) ---
echo "Installing Docker..."
sudo apt update -y
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add user to docker group (no prompt)
sudo usermod -aG docker "$USER"

# --- 3. Install Docker Compose (silent) ---
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# --- 4. Install GitHub CLI (gh) (auto-yes) ---
echo "Installing GitHub CLI (gh)..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update -y
sudo apt install -y gh

# --- Final Message ---
echo ""
echo "✅ All tools installed successfully!"
echo "- Miniconda: Installed in '$HOME/miniconda' (run 'source ~/.bashrc')"
echo "- Docker: Installed (run 'newgrp docker' or relogin to avoid sudo)"
echo "- Docker Compose: Installed in '/usr/local/bin/docker-compose'"
echo "- GitHub CLI: Installed (run 'gh --version')"
