#!/bin/bash
set -e # exit on error maybe change this later

# a shell script to install the necessary programs for these dotfiles, and other basic programs
# this assumes you're using manjaro linux with bash and pacman installed (which should be any unmodified manjaro installation), so you will have to update these commands
# for other distributions

install() {
    pacman -S -q --noconfirm --needed $@
}

install curl # for installing things duh
install coreutils  
echo "we've installed the gnu coreutils to your computer so that these scripts can have access to certian necessary commands, however, if you don't see yourself using the them in the future, feel free to remove it with the command
    sudo pacman -Rs coreutils"

# install zsh and oh-my-zsh 
install zsh 
# check if omz is already installed with the $ZSH varible (TODO: make sure this is actually a omz thing), and then install omz in non-interactive mode 
# look at the code that we're curling down for more info on how to customize the ohmyzsh install through environment variables
[ $ZSH ] || RUNZSH='no' sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
# chsh -s /bin/zsh  # uncomment this to automatically set shell to zsh
echo "zsh is installed but it might not be your default shell yet, to set it to your default shell please run
    chsh -s /bin/zsh"

# install neovim and necessary neovim plugins
install vim-runtime neovim python-pynvim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vscodium / vscode -- we don't install plugins for you because I don't really care about vscode plugins enough to do that
install code 

# install mcomix -- it works without any "plugins"
install mcomix 

# install deluge -- another one liner
install deluge deluge-gtk

# fastfetch -- if you already have neofetch installed this script will use that instead
pacman -Q neofetch 2&1> /dev/null || install fastfetch 

pacman -Q neofetch 2&1> /dev/null && sudo ln -S /bin/neofetch /bin/flashfetch # this is just so I don't have to edit /home/user/.zshrc

# install ninja if you have cmake installed
pacman -Q cmake 2&1> /dev/null && install ninja

# remove nano because it's a horrible text editor and you're better off just using whatever graphical notepad comes preinstalled with your version of manjaro (or of course using neovim)
pacman -Q nano 2&1> /dev/null && sudo pacman -Rs nano 

# remove gimp because literally no one has ever though "yeah let me open up gimp real quick"
# pacman -Q gimp && sudo pacman -Rs gimp
