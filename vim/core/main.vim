" Config
"   Colors
" set termguicolors

"   Center cursor
set scrolloff=8

"   Cursor effects
set cursorline
"set cursorcolumn

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
set spell
set spell spelllang=es_es,en_us

"   Line number
set number relativenumber

"   Paste images md
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>   " This will collapse with the paste from system clipboard mapping

"   Treesitter
lua << EOF
require 'nvim-treesitter.install'.compilers = {"gcc"} -- Must use mingw64 gcc `scoop install mingw` https://github.com/nvim-treesitter/nvim-treesitter/issues/1897

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
    "python",
    "rust",
    "dockerfile",
    "latex",
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
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

"   Coc settings
let g:coc_global_extensions = [
            \'coc-css',
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
            \'coc-emmet',
            \'coc-eslint',
            \'coc-markdownlint',
            \'@yaegassy/coc-intelephense',
            \'coc-sumneko-lua',
            \'coc-deno',
            \'coc-toml',
            \'coc-tsserver',
            \'coc-rust-analyzer',
            \'@yaegassy/coc-volar',
            \'@yaegassy/coc-volar-tools',
            \'@yaegassy/coc-typescript-vue-plugin',
            \'@yaegassy/coc-laravel',
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

"   Line numbers
set number relativenumber
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

"	  Mouse
set mouse+=a

"   Theme
" colorscheme catppuccin_mocha
colorscheme mellow
" colorscheme lunaperche
" colorscheme habamax
let g:mellow_italic_functions = 1
let g:mellow_bold_functions = 1
let g:mellow_transparent = 1

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

"   telescope setup
lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { 
      "node_modules/*",
      "vendor/*",
      "build/*",
      "target/*",
      "bin/*",
      ".git/*",
      ".idea/*",
      "dist/*",
      "gradlew*",
      "desktop.ini"
    },
  },
}
EOF

augroup Telescope
  autocmd!
  "   Close mini-files on telescope open
  " autocmd User TelescopePreviewerLoaded :lua MiniFiles.close()
augroup END

"   No spell check on terminal windows
au TermOpen * setlocal nospell

"   Source vim file on save
if !has("nvim")
  autocmd BufWritePost .vimrc source % | echo "Reloaded .vimrc"
endif

"   DAP
lua require 'tortitas/dap'

"   Netrw
"   https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search
