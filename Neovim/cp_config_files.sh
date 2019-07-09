#!/bin/bash
NEOVIM_CONFIG_FILE=$HOME/.config/nvim/init.vim
NEOVIM_CONFIG_COLORS_DIR=$HOME/.config/nvim/colors
NEOVIM_CONFIG_SYNTAX_DIR=$HOME/.config/nvim/syntax

if [ -f "$NEOVIM_CONFIG_FILE" ]; then
  NEOVIM_CONFIG_FILE_BACKUP=$HOME/.config/nvim/init.vim.$(date +%s)
  echo "Taking a backup of existing Neovim configuration file."
  /bin/cp -v $NEOVIM_CONFIG_FILE $NEOVIM_CONFIG_FILE_BACKUP
  echo "Backup: $NEOVIM_CONFIG_FILE_BACKUP"
fi

if [ -d "$NEOVIM_CONFIG_COLORS_DIR" ]; then
  NEOVIM_CONFIG_COLORS_DIR_BACKUP=$HOME/.config/nvim/colors_$(date +%s)
  echo "Taking a backup of existing Neovim colors directory."
  /bin/cp -rv $NEOVIM_CONFIG_COLORS_DIR $NEOVIM_CONFIG_COLORS_DIR_BACKUP
  echo "Backup: $NEOVIM_CONFIG_COLORS_DIR_BACKUP"
fi

if [ -d "$NEOVIM_CONFIG_SYNTAX_DIR" ]; then
  NEOVIM_CONFIG_SYNTAX_DIR_BACKUP=$HOME/.config/nvim/syntax_$(date +%s)
  echo "Taking a backup of existing Neovim syntax directory."
  /bin/cp -rv $NEOVIM_CONFIG_SYNTAX_DIR $NEOVIM_CONFIG_SYNTAX_DIR_BACKUP
  echo "Backup: $NEOVIM_CONFIG_SYNTAX_DIR_BACKUP"
fi
