"Disable compatibility with vi or whatever
set nocompatible

"Enable syntax highlight by default
syntax on

"Enable plugins
filetype plugin on

"Fuzzy file finding
set path+=**
set wildmenu
"	use :find to find files

let g:prettier#autoformat = 1

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme' " Requires going to plugin folder and running install.py
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'mattn/emmet-vim'

call plug#end()

" Config
"   Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,scss EmmetInstall
let g:user_emmet_leader_key=','

"	  Mouse
set mouse+=a

"   Theme
colorscheme catppuccin_macchiato

"   Airline
let g:airline_theme = 'catppuccin_mocha'
set laststatus=2

"   Ale
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'vue': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

"	  Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

"   Auto enter NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

"   Mappings
map <F8> :tabp<CR>
map <F9> :tabn<CR>
cnoreabbrev ser :CtrlSF
nmap b :NERDTree<CR>
tnoremap <F8> <C-W>:tabp<CR>
tnoremap <F9> <C-W>:tabn<CR>
