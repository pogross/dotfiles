#! /bin/bash

DOTFILES=(.bashrc_custom .nanorc .tmux-conf .vimrc)

# Remove old dotfiles and replace them
for dotfile in $(echo ${DOTFILES[*]});
do
    rm ~/$(echo $dotfile)
    ln -s ~/dotfiles/$(echo $dotfile) ~/$(echo $dotfile)
done
