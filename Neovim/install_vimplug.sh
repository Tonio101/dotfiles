#!/bin/bash

# Create 'autoload' dir in $HOME/.local/share/nvim/site/autoload/
# and place the plug.vim file there.
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ls -lrt $HOME/.local/share/nvim/site/autoload
