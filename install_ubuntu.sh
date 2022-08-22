#!/bin/bash

# Run
# sudo chmod +x install_ubuntu.sh
# bash install_ubuntu.sh

cd ~

# Updated repos
sudo apt update -y && sudo apt upgrade -y

# Install apt packages
sudo apt install git stow -y
cd ~/.server_workspace/
stow -vSt ~ nvim
cd ~

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
lazygit --version

# Install "Packer" plugin manager for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz

# Add nvim as alias of vim
echo "alias vim='/home/ubuntu/nvim-linux64/bin/nvim'" >> .bashrc
echo "export EDITOR='vim'" >> .bashrc
source ~/.bashrc

echo "Installing Finished"
echo "run vim and PackerSync"
