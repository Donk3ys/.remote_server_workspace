#!/bin/bash

# Run
# sudo chmod +x install_ubuntu.sh
# bash install_ubuntu.sh

cd ~

# Updated repos
sudo apt update -y && sudo apt upgrade -y

# Install apt packages
sudo apt install fzf fd-find stow gcc g++ -y
cd ~/.remote_server_workspace/
stow -vSt ~ nvim
cd ~

# Install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
rm ripgrep_13.0.0_amd64.deb

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
sudo rm lazygit.tar.gz
lazygit --version

# Install "Packer" plugin manager for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Add alias and envs
echo '
alias vim="/home/ubuntu/nvim-linux64/bin/nvim"
export EDITOR="vim"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME --type f --hidden --follow --exclude .git"
' >> .bashrc

source ~/.bashrc

echo "Installing Finished"
echo "run vim and PackerSync"
