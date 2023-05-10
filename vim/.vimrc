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
colorscheme darkblue

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
map <F8> :tabp<CR>
map <F9> :tabn<CR>
cnoreabbrev gco :Git checkout
cnoreabbrev ga :Git add --all
cnoreabbrev gc :Git commit -m
cnoreabbrev gs :Git status
cnoreabbrev term :FloatermNew<CR>
nmap B :NERDTree<CR>
tnoremap <F8> <C-W>:tabp<CR>
tnoremap <F9> <C-W>:tabn<CR>
tnoremap <Esc> <C-\><C-n>
nmap º :FloatermToggle<CR>
