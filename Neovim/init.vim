
"*****************************************************************
" vim-plug Plugin Manager
"*****************************************************************
" Plugins list can be found in: https://vimawesome.com/

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/site/autoload/plug.vim
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoplete-clangx'
Plug 'zchee/deoplete-clang'
Plug 'octol/vim-cpp-enhanced-highlight'
" Initialize plugin system
call plug#end()


" ctrlp.vim configurations
" https://vimawesome.com/plugin/ctrlp-vim-everything-has-changed
let g:ctrlp_root_markers = ['.gitignore', '.p4ignore']
"directory of the current file, unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"    \ 'file': '\v\.(exe|so|dll)$',
"    \ 'link': 'some_bad_symbolic_links',
"    \ }

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
let g:deoplete#sources#clang#std#cpp = 'c++11'
" Change clang binary path
"call deoplete#custom#var('clangx', 'libclang.so.1', '/usr/lib/llvm-3.8/lib/')
"
"" Change clang options
"call deoplete#custom#var('clangx', 'default_c_options', '')
"call deoplete#custom#var('clangx', 'default_cpp_options', '')

let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_no_function_highlight = 1
"let c_no_curly_error = 1

"*****************************************************************
" Non-Plugin Stuff After This Line
"*****************************************************************
"autocmd filetype python set expandtab
filetype indent on
set mouse=a "Set mouse
set clipboard=unnamed "Allow to copy/paste from clipboard
syntax on "Syntax color
colorscheme dracula
"colors dracula " ~/.config/nvim/colors/dracula.vim

set wildmenu "Visual autocomplete for command menu
set showmatch "Highlight matching [{()}]
set incsearch "Search as characters are entered
set hlsearch "Highlight matches
"let &colorcolumn="80,".join(range(119,999),",")
nnoremap <F1> :nohlsearch<CR>

"Ignore file types
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

" Toggle between mouse mode ON and OFF
map <F2> :exec &mouse!=""? "set mouse=" : "set mouse=a"<CR>
" Sometimes my spelling can be very bad :(
nnoremap <F6> :setlocal spell spelllang=en_us<CR>
nnoremap <F7> :set nospell<CR>

set ignorecase "Always case-insensitive
set smartcase  " ignore case if search pattern is lower case
               " case-sensitive otherwise
set ruler "Show row and column ruler information
set showcmd "Show command in bottom bar
set title "Don't forget what file your editing
"set paste

" 1 tab == 2 spaces
set shiftwidth=4    "Number of spaces to use for autoindent
set tabstop=4       "Number of visual spaces per TAB
set softtabstop=4   "Number of spaces in tab when editing
set expandtab       "Insert spaces for tabs
"setlocal expandtab  "Insert spaces for tabs

" Perl Files = 4 Space Tabs
autocmd BufRead, BufNewFile *.pl,*.pm setfiletype perl
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set mouse=a "Set mouse

"These are recommended
set smarttab "Be smart when using tabs
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
"set backspace=2 " make backspace work like most other programs
""match Todo /16 03\|client_hello\|server_hello\|server_certificate\|server_key_exchange\|server_hello_done\|client_key_exchange\|change_cipher_spec\|verify_finished\|finished\|14 03\|17 03/
"set backspace=indent,eol,start
"set path=.,/usr/include,,** "Cant delete in vim?
"*****************************************************************
