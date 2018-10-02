autocmd filetype python set expandtab
set mouse=a "Set mouse
set clipboard=unnamed "Allow to copy/paste from clipboard
syntax on "Syntax color
"color dracula
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
"set title "Don't forget what file your editing
set paste
"set visualbell
set tabstop=2
"set tabstop=4
set softtabstop=0
"set noexpandtab dont convert tabs into spaces
set expandtab
set shiftwidth=2
"set shiftwidth=4
set smarttab
"set smartindent
set backspace=indent,eol,start
