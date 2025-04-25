#!/bin/bash

echo "Installing Miniconda..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
rm miniconda.sh

# Initialize conda
source $HOME/miniconda/bin/activate
conda init bash
source ~/.bashrc

echo "Miniconda installed. Restart your terminal or run 'source ~/.bashrc'."
