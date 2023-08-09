" " Disable compatibility with vi
" set nocompatible
"
" " Enable syntax highlight by default
" syntax on
"
" " Enable plugins
" filetype plugin on
"
" " Fuzzy file finding
" set path+=**
" set wildmenu
"
" " Colorscheme
" colorscheme muon
"
" " Config
" "   Leader key
" let mapleader=","
"
" "   Center cursor
" set scrolloff=8
"
" "   Line numbers
" set number
"
" "	  Mouse
" set mouse+=a
"
" "	  Tabs
" set expandtab
" set tabstop=2
" set shiftwidth=2
" set autoindent
"
" "   Mappings
" map <leader>7 :tabp<CR>
" map <leader>8 :tabn<CR>
" tnoremap <F8> <C-W>:tabp<CR>
" tnoremap <F9> <C-W>:tabn<CR>
" tnoremap <Esc> <C-\><C-n>

runtime! ~/.vim/core/*.vim
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
