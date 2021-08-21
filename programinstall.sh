#!/bin/bash
set -e # exit on error maybe change this later

# a shell script to install the necessary programs for these dotfiles, and other basic programs
# this assumes you're using manjaro linux with bash and pacman installed (which should be any unmodified manjaro installation), so you will have to update these commands
# for other distributions

sudo pacman -S curl --needed # for installing things duh
sudo pacman -S coreutils --needed && pacman -Rs nano # install basic gnu dev tools, and remove nano because it's the worst editor on planet earth
# i'm not really a big fan of coreutils but I believe it's necessary for the ln command. if you don't want it you can just uninstall it afterwards with the command sudo pacman -Rs coreutils

# install zsh and oh-my-zsh 
sudo pacman -S zsh --needed 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
# chsh -s /bin/zsh  # uncomment this to automatically set shell to zsh
echo "zsh is installed but it might not be your default shell yet, to set it to your default shell please run
    chsh -s /bin/zsh"

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

# fastfetch -- if you already have neofetch installed this script will use that instead
pacman -Q neofetch || \
    sudo pacman -S fastfetch --needed

pacman -Q neofetch && sudo ln -S /bin/neofetch /bin/flashfetch # this is just so I don't have to edit /home/user/.zshrc

# install ninja if you have cmake installed
pacman -Q cmake && pacman -S ninja --needed 
