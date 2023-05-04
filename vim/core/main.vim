" Config
"   Colors
set termguicolors

"   Center cursor
set scrolloff=8

"   Cursor effects
set cursorline
" set cursorcolumn

"   Spell check
set spell
set spell spelllang=es_es,en_us

"   Paste images md with img-paste-devs/img-paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>P :call mdip#MarkdownClipboardImage()<CR>

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
lua << EOF

-- https://blog.pabuisson.com/2022/08/neovim-modern-features-treesitter-and-lsp/
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "vimls", "tsserver", "volar", "intelephense", "cssls" },
  automatic_installation = true
}

-- add new lsp servers here
-- :help lspconfig-all to list all options
local nvim_lsp = require('lspconfig')

nvim_lsp.lua_ls.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
  end
}
nvim_lsp.intelephense.setup{}
nvim_lsp.cssls.setup{}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<CR>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Copilot tabmap
vim.g.copilot_assume_mapped = true

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
" colorscheme catppuccin_mocha
" colorscheme mellow
colorscheme habamax
" let g:mellow_italic_functions = 1
" let g:mellow_bold_functions = 1
" let g:mellow_transparent = 1

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
