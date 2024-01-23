" Config
"   Colors
" set termguicolors

"	  Mouse
set mouse+=a

"   Hard ass vim 
"   Credits: https://vi.stackexchange.com/users/74/dhruva-sagar
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  " exec 'inoremap' key '<Nop>'
  " exec 'cnoremap' key '<Nop>'
endfor

"   Center cursor
set scrolloff=8

"   Cursor effects
set cursorline
"set cursorcolumn
set colorcolumn=80

"   Set Powershell
if has('win64') || has('win32')
  let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
  let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
  let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
  set shellquote= shellxquote=

  let g:floaterm_shell='powershell'
endif

"   Spell check
"   NOTE: If you get an error on boot, run the line bellow this comment and it
"   will prompt a download of the spellfiles.
set spell spelllang=es_es,en_us

"   Treesitter
silent! lua << EOF
require 'nvim-treesitter.install'.compilers = {"clang"} -- Must use llvm `scoop install llvm` https://github.com/nvim-treesitter/nvim-treesitter/issues/1897

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "typescript",
    "vue",
    "java",
    "php",
    "html",
    "css",
    "scss",
    "json",
    "yaml",
    "toml",
    "bash",
    "ruby",
    "python",
    "rust",
    "dockerfile",
    "latex",
  },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {
      "latex", -- Vimtex already does this
    },
  },
}

vim.filetype.add({extension = {mdx = 'mdx'}})
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.mdx = "markdown"

EOF

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

"   Coc settings
let g:coc_global_extensions = [
            \'coc-zig',
            \'coc-css',
            \'coc-vimlsp',
            \'coc-json',
            \'coc-yaml',
            \'coc-snippets',
            \'coc-clangd',
            \'coc-html',
            \'coc-xml',
            \'coc-prettier',
            \'coc-highlight',
            \'coc-sh',
            \'coc-pyright',
            \'coc-kotlin',
            \'coc-emmet',
            \'coc-eslint',
            \'coc-markdownlint',
            \'@yaegassy/coc-intelephense',
            \'coc-php-cs-fixer',
            \'coc-sumneko-lua',
            \'coc-deno',
            \'coc-toml',
            \'coc-tsserver',
            \'coc-rust-analyzer',
            \'coc-java',
            \'coc-db',
            \'coc-go',
            \'coc-perl',
            \'coc-elixir',
            \'coc-solargraph',
            \'coc-biome',
            \'@yaegassy/coc-volar',
            \'@yaegassy/coc-volar-tools',
            \'@yaegassy/coc-typescript-vue-plugin',
            \'@yaegassy/coc-laravel',
            \'@yaegassy/coc-tailwindcss3',
            \]

"   Startify config
if has('win32')
  let g:startify_bookmarks = [
       \ { 'c': '~/AppData/Local/nvim' },
       \ { 'h': '~' },
       \ { 'g': '~/Documents/Git' },
       \ ]
else
  let g:startify_bookmarks = [
       \ { 'c': '~/.config/nvim' },
       \ { 'h': '~' },
       \ { 'g': '~/Git' },
       \ ]
endif
" thanks! https://github.com/cpow/neovim-for-newbs/blob/main/lua%2Fplugins%2Falpha.lua
let g:startify_custom_header = [
\ '                                                                       ',
\ '                                                                     ',
\ '       ████ ██████           █████      ██                     ',
\ '      ███████████             █████                             ',
\ '      █████████ ███████████████████ ███   ███████████   ',
\ '     █████████  ███    █████████████ █████ ██████████████   ',
\ '    █████████ ██████████ █████████ █████ █████ ████ █████   ',
\ '  ███████████ ███    ███ █████████ █████ █████ ████ █████  ',
\ ' ██████  █████████████████████ ████ █████ █████ ████ ██████ ',
\ '                                                                       ',
\ ]

"   Line numbers
" set number relativenumber
set number
" lua vim.opt.statuscolumn = "%l %r"

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

"   Theme
if has("nvim")
  " colorscheme mellow
  " let g:mellow_italic_functions = 1
  " let g:mellow_bold_functions = 1
  " let g:mellow_transparent = 1
  colorscheme oxocarbon
  set background=dark
endif

"	  Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

"   Auto create folder on save
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

augroup Telescope
  autocmd!
  "   Close mini-files on telescope open
  " autocmd User TelescopePreviewerLoaded :lua MiniFiles.close()
augroup END

"   No spell check on terminal
silent! au TermOpen * setlocal nospell

"   Source vim file on save
if !has("nvim")
  autocmd BufWritePost .vimrc source % | echo "Reloaded .vimrc"
endif

"   DAP
silent! lua require 'tortitas/dap'

"   DadBod UI
let g:db_ui_auto_execute_table_helpers = 1
let g:db_ui_win_position = 'right'
let g:db_ui_show_database_icon = 1
let g:db_ui_show_database_icon = 1
let g:db_ui_use_nerd_fonts = 1

"   Netrw
"   https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search

"   Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
"   Paste images
autocmd FileType markdown nmap <buffer><silent> <leader><leader><leader>p :call mdip#MarkdownClipboardImage()<CR>

"   VimTex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

"   LanguageTool
let g:languagetool_cmd='/usr/bin/languagetool'

"   Copilot
let g:copilot_filetypes = {
                        \ 'markdown': v:true,
                        \ }
