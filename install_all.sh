#!/bin/bash

chmod +x install_miniconda.sh
./install_miniconda.sh
chmod +x install_docker.sh
sudo ./install_docker.sh
chmod +x install_docker_compose.sh
sudo ./install_docker_compose.sh
chmod +x install_gh.sh
sudo ./install_gh.sh

echo "All tools installed!"
