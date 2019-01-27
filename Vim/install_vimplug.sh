#!/bin/bash

# Create 'autoload' dir in your .vim/
# and place the plug.vim file there
# Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
