#!/bin/bash

# set default git config
git config --global credential.helper store
if [ -n "$EMAIL" ]; then
	read -p "Enter your git email: " EMAIL
	git config --global user.email $EMAIL
fi

if [ -n "$NAME" ]; then
	read -p "Enter your git name: " NAME
	git config --global user.name $NAME
fi

# create necesary folders
mkdir -p ~/bin \
    ~/.config/nvim \
    ~/.npm-global \
    ~/workspaces/dotfiles \
    ~/workspaces/c/opensource \
    ~/workspaces/c/projects \
    ~/workspaces/c/temp \
    ~/workspaces/bsp/opensource \
    ~/workspaces/bsp/projects \
    ~/workspaces/bsp/temp \
    ~/workspaces/go/opensource \
    ~/workspaces/go/projects \
    ~/workspaces/go/temp \
    ~/workspaces/python/opensource \
    ~/workspaces/python/projects \
    ~/workspaces/python/temp

if [ "Ubuntu" == `uname -a|sed 's/.*-//g'|sed 's/SMP.*//g'` ]
then
   cd neovim_for_ubuntu1604/
   ./setup.sh
fi
