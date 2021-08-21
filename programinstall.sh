#!/bin/bash
set -e # exit on error maybe change this later

# a shell script to install the necessary programs for these dotfiles, and other basic programs
# this assumes you're using manjaro linux with bash and pacman installed (which should be any unmodified manjaro installation), so you will have to update these commands
# for other distributions

sudo pacman -S curl --needed # for installing things duh

# install zsh and oh-my-zsh 
sudo pacman -S zsh --needed 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
# sudo chsh -s /bin/zsh  # uncomment this to automatically set shell to zsh

# install neovim and necessary neovim plugins
sudo pacman -S vim-runtime nvim python-pynvim --needed 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ 
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vscodium / vscode -- we don't install plugins for you because I don't really care about vscode plugins enough to do that
sudo pacman -S code --needed

# install mcomix -- it works without any "plugins"
sudo pacman -S mcomix --needed

# install deluge -- another one liner
sudo pacman -S deluge deluge-gtk --needed
