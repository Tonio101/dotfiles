"*****************************************************************
" Vim Plugins (Vundle)
"*****************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" Auto Complete
"Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"*****************************************************************
"" Non-Plugin Stuff After This Line
"*****************************************************************
autocmd filetype python set expandtab
filetype indent on
set mouse=a "Set mouse
set clipboard=unnamed "Allow to copy/paste from clipboard
syntax enable "Syntax color
set wildmenu "Visual autocomplete for command menu
set showmatch "Highlight matching [{()}]
set incsearch "Search as characters are entered
set hlsearch "Highlight matches
nnoremap <F1> :nohlsearch<CR>
" Toggle between mouse mode ON and OFF
map <F2> :exec &mouse!=""? "set mouse=" : "set mouse=a"<CR>
" Sometimes my spelling can be very bad :(
nnoremap <F6> :setlocal spell spelllang=en_us<CR>
nnoremap <F7> :set nospell<CR>
set ignorecase "Always case-insensitive
"set ruler "Show row and column ruler information
set showcmd "Show command in bottom bar
set title "Don't forget what file your editing
set paste
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab " Use spaces instead of tabs
set smarttab
set smartindent
"set statusline+=%f
set laststatus=2 "Turn on status line
set statusline=
set statusline+=%.70F "\ %F "Full path of file, truncated if necessary
set statusline+=%m "Modified flag
set statusline+=%r "read only flag
set statusline+=%= "left/right separator
set statusline+=[%6l]: "cursor line w/ padding (less distractive)
set statusline+=[%3c] "cursor column w/ padding (less distractive)
set statusline+=\ %P "percent through file
" "*****************************************************************
