#! /bin/bash

DOTFILES=(".aliases" ".bashrc_custom" ".nanorc" ".tmux-conf" ".vimrc")

# Remove old dotfiles and replace them
for dotfile in ${DOTFILES[*]}; do
    echo "Copying $dotfile ..."
    if [ -f "~/$dotfile" ]; then
        rm "~/$dotfile"
    fi
    ln -s "~/dotfiles/$dotfile" "~/$dotfile"
done
