#! /bin/bash

DOTFILES=(".aliases" ".bashrc_custom" ".nanorc" ".tmux-conf" ".vimrc")

# Remove old dotfiles and replace them
for dotfile in ${DOTFILES[*]}; do
    
    if [ -f "${HOME}/${dotfile}" ]; then
        echo "Removing old file or link of ${dotfile}"
        rm "${HOME}/${dotfile}"
    fi

    if [ -L "${HOME}/${dotfile}" ]; then 
        echo "${HOME}/${dotfile} already linked"
    else 
        echo "Linking ${dotfile}"
        ln -s "${HOME}/dotfiles/${dotfile}" "${HOME}/${dotfile}"
    fi
done

