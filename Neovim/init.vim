"******************************************************************************
" vim-plug Plugin Manager
"******************************************************************************
" Plugins list can be found in: https://vimawesome.com/

" Specify a directory for plugins
" - Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" Ignore file types
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

"******************************************************************************
" ctrlpvim
"******************************************************************************
" ctrlp.vim configurations
" https://vimawesome.com/plugin/ctrlp-vim-everything-has-changed
" Source code root markers defined with the
let g:ctrlp_root_markers = ['.gitignore', '.p4ignore']
" If a file is already open, open it again in a new pane
" instead of switching to the existing pane. (Ctrl + t)
let g:ctrlp_switch_buffer = 'et'

"directory of the current file, unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode = 'a'

" Neovim's wildignore instead.
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"    \ 'file': '\v\.(exe|so|dll)$',
"    \ 'link': 'some_bad_symbolic_links',
"    \ }

"******************************************************************************
" deoplete
"******************************************************************************
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-10/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header  = '/usr/include/clang'
let g:deoplete#sources#clang#std#cpp       = 'c++11'

"******************************************************************************
" vim-cpp-enhanced-highlight
"******************************************************************************
let g:cpp_class_scope_highlight = 1 "Highlight class scope, vars, functions, etc.

"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_no_function_highlight = 1
"let c_no_curly_error = 1

"******************************************************************************
" Non-Plugin Stuff After This Line
"******************************************************************************
filetype indent on              " autocmd filetype python set expandtab
set mouse=a                     " Enable mouse functionality
set clipboard=unnamed           " Allow to copy/paste from clipboard
syntax on                       " Syntax color
colorscheme dracula             " Enable dracula plugin

set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching [{()}]
set incsearch                   " Search as characters are entered
set hlsearch                    " Highlight matches
set inccommand=nosplit          " Interactive substitute command (a must have!)

set ignorecase                  " Always case-insensitive
set smartcase                   " ignore case if search pattern is lower case
                                " case-sensitive otherwise
set ruler                       " Show row and column ruler information
set showcmd                     " Show command in bottom bar
set title                       " Don't forget what file your editing
"set paste                      " Disable automated indenting on paste
set completeopt-=preview        " Disable autocomplete preview (Scratch split)

"******************************************************************************
" Spacing/Tabs - 1 tab == 4 spaces
"******************************************************************************
set shiftwidth=4                " Number of spaces to use for autoindent
set tabstop=4                   " Number of visual spaces per TAB
set softtabstop=4               " Number of spaces in tab when editing
set expandtab                   " Insert spaces for tabs
"setlocal expandtab             " Insert spaces for tabs

" Perl Files = 4 Space Tabs
autocmd BufRead, BufNewFile *.pl,*.pm setfiletype perl
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab

"******************************************************************************
" Splits/Indents
"******************************************************************************
set splitbelow                  " Open new split panes to right and bottom,
set splitright                  " which feels more natural

set smarttab                    " Be smart when using tabs
set smartindent

"******************************************************************************
" Status bar
"******************************************************************************
"set statusline+=%f
set laststatus=2                " Turn on status line
set statusline=
set statusline+=%.70F           " \ %F "Full path of file, truncated if necessary
set statusline+=%m              " Modified flag
set statusline+=%r              " read only flag
set statusline+=%=              " left/right separator
set statusline+=[%6l]:          " cursor line w/ padding (less distractive)
set statusline+=[%3c]           " cursor column w/ padding (less distractive)
set statusline+=\ %P            " percent through file

"******************************************************************************
" Delete key
"******************************************************************************
"set backspace=2        " make backspace work like most other programs
"set backspace=indent,eol,start
"set path=.,/usr/include,,** "Cant delete in vim?

"******************************************************************************
" Key mappings
"******************************************************************************
"nnoremap <F1> :nohlsearch<CR>
"" Toggle between mouse mode ON and OFF
"map <F2> :exec &mouse!=""? "set mouse=" : "set mouse=a"<CR>
"" Toggle between spell check
"nnoremap <F7> :setlocal spell spelllang=en_us<CR>
"nnoremap <F8> :set nospell<CR>

" New keyboard, very unconventional to press the function keys
nnoremap <space> :nohlsearch<CR>
" Toggle between mouse mode ON and OFF
map m :exec &mouse!=""? "set mouse=" : "set mouse=a"<CR>
" Toggle spell check
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> s :call ToggleSpellCheck()<CR>

"******************************************************************************
" Automatic toggling between line number modes
"******************************************************************************
set number relativenumber

"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
