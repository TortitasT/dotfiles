" Disable compatibility with vi
set nocompatible

" Enable syntax highlight by default
syntax on

" Enable plugins
filetype plugin on

" Fuzzy file finding
set path+=**
set wildmenu

" Colorscheme
colorscheme paramount

" Config
"   Leader key
let mapleader=","

"   Center cursor
set scrolloff=8

"   Line numbers
set number

"	  Mouse
set mouse+=a

"	  Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

"   Mappings
map <leader>7 :tabp<CR>
map <leader>8 :tabn<CR>
tnoremap <F8> <C-W>:tabp<CR>
tnoremap <F9> <C-W>:tabn<CR>
tnoremap <Esc> <C-\><C-n>
