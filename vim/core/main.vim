function! PlugLoaded(name)
    return 0
endfunction 

" Config
"   Colors
set termguicolors

"   Center cursor
set scrolloff=8

"   Cursor effects
set cursorline
"set cursorcolumn

"   Spell check
set spell
set spell spelllang=es_es,en_us

"   Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "vue" },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"   LSP
lua <<EOF
--local lsp = require('lsp-zero').preset({})

--lsp.on_attach(function(client, bufnr)
--  lsp.default_keymaps({buffer = bufnr})
--end)
--
--lsp.ensure_installed({
--  'clangd',
--  'volar',
--  'eslint',
--  'rust_analyzer',
--  'intelephense'
--})

--require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

--lsp.setup()
EOF

"   Save when not root
if has("bsd")
  command WriteRoot :w !doas tee %
elseif has("linux")
  command WriteRoot :w !sudo tee %
endif

"   Neovide
if exists("g:neovide")
  set guifont=Fira\ Code:h14

  let g:neovide_scale_factor = 1
  let g:neovide_padding_top = 25
  let g:neovide_padding_bottom = 25
  let g:neovide_padding_left = 25
  let g:neovide_padding_right = 25

  if has("mac")
    let g:neovide_scale_factor = 1.2
    let g:coc_node_path = "~/.nvm/versions/node/v16.19.1/bin/node" 
  endif
endif

"   Startify config
let g:startify_bookmarks = [
\ { 'y': '~/Documents/Git/descommarket/yapayoo' },
\ { 'c': '~/Documents/Git/misc/dotfiles/vim' },
\ ]

"   Emmet
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,vue,scss EmmetInstall

"   Line numbers
set number relativenumber
lua vim.opt.statuscolumn = "%l %r"

"   Font
if has("gui_running")
  if has("gui_gtk2")
  elseif has("gui_macvim")
  elseif has("gui_win32")
    set guifont=Fira\ Code:h14
  endif
endif

"   Backspace windows fix
if has("win32")
  set backspace=indent,eol,start
endif

"	  Mouse
set mouse+=a

"   Theme
colorscheme catppuccin_mocha

"   Airline
if PlugLoaded('vim-airline')
  let g:airline_theme = 'catppuccin_mocha'
  set laststatus=2
  set noshowmode
endif

"   Ale
if PlugLoaded('ale')
  let g:ale_fixers = {
   \ 'javascript': ['eslint'],
   \ 'vue': ['eslint']
   \ }
  let g:ale_sign_error = '❌'
  let g:ale_sign_warning = '⚠️'
  let g:ale_fix_on_save = 1
endif

"	  Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

"   Auto enter NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    "\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

"   NERDTree show hidden
let NERDTreeShowHidden=1

"   NERDTree right
let g:NERDTreeWinPos = "right"

"   telescope ignore files
lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { 
      "node_modules/*",
      "vendor/*",
      "build/*",
      "bin/*",
      ".git/*",
      ".idea/*",
      "dist/*",
      "gradlew*",
      "desktop.ini"
    },
  }
}
EOF
