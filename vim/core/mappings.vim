" Mappings
"   Leader key
let mapleader = ","

"   Git 
cnoreabbrev gco :Git checkout
cnoreabbrev ga :Git add --all
cnoreabbrev gc :Git commit -m
cnoreabbrev gs :Git status

"   NERDTree
nmap B :NERDTree<CR>

"   Tabs
map <F8> :tabp<CR>
map <F9> :tabn<CR>
tnoremap <F8> <C-W>:tabp<CR>
tnoremap <F9> <C-W>:tabn<CR>

"   Floaterm
cnoreabbrev term :FloatermNew<CR>
tnoremap <Esc> <C-\><C-n>
nmap º :FloatermToggle<CR>

"   Copy paste to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

vnoremap  <leader>p  "+p
nnoremap  <leader>p  "+p
vnoremap  <leader>P  "+P
nnoremap  <leader>P  "+P

"   Telescope
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <C-p> <cmd>Telescope commands<cr>

"   COC
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

"   Intelisense lens
nmap <silent> gl <Plug>(coc-codelens-action)

"   Copilot map C-e to accept
imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
let g:copilot_no_tab_map = v:true

"   Emmet leader key
let g:user_emmet_leader_key=','
