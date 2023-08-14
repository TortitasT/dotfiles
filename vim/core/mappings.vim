" Mappings
"   Leader key
let mapleader = ","

"   Refresh config
command! Refresh source $MYVIMRC | source $MYVIMRC
command! Reload source $MYVIMRC | source $MYVIMRC

"   Git 
cnoreabbrev gco :Git checkout
cnoreabbrev ga :Git add --all
cnoreabbrev gc :Git commit -m
cnoreabbrev gs :Git status
cnoreabbrev gb :Git branch --sort=-committerdate

"   Mini-files
map B <cmd>lua MiniFiles.open()<CR>

"   NeoTree
map <C-b> :NeoTreeShowToggle<CR>

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
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <C-p> <cmd>Telescope commands<CR>

nnoremap <leader>fr <cmd>lua require('telescope').extensions.recent_files.pick()<CR>

"   COC
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

"   Intelisense lens
nmap <silent> gl <Plug>(coc-codelens-action)

"   Copilot map C-e to accept
imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
let g:copilot_no_tab_map = v:true

"   :Q to quit too since I can't stop pressing shift
:command Q q

"   Emmet leader key
let g:user_emmet_leader_key=','
let user_emmet_expandabbr_key=','

"   Misc
command! -nargs=0 CopyBufPath :let @+ = expand("%:p")

"   CokeLine
nmap <leader>7 <Plug>(cokeline-focus-prev)
nmap <leader>8 <Plug>(cokeline-focus-next)

"   CocCommands
"       Laravel
command! -nargs=0 LaravelTestFile :CocCommand intelephense.phpunit.fileTest
command! -nargs=0 LaravelTestSingle :CocCommand intelephense.phpunit.singleTest
command! -nargs=0 LaravelTestProject :CocCommand intelephense.phpunit.projectTest

"   JABS
nmap <leader>b :JABS<CR>

"   CocMappings
nmap <leader><leader>p :CocCommand<CR>
