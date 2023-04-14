function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

"let g:plugs_disabled = ['ale', 'vim-vue']

call plug#begin()

Plug 'scrooloose/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"Plug 'w0rp/ale'

Plug 'mattn/emmet-vim'

Plug 'github/copilot.vim' " Requires to sign up

Plug 'posva/vim-vue'

Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'

Plug 'Shougo/denite.nvim'

Plug 'rstacruz/vim-closer'

Plug 'mhinz/vim-signify'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'mhinz/vim-startify'

Plug 'voldikss/vim-floaterm'

Plug 'wakatime/vim-wakatime', { 'branch': 'master' }

Plug 'ap/vim-css-color'

Plug 'yggdroot/indentline'

Plug 'APZelos/blamer.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'folke/zen-mode.nvim'

Plug 'adalessa/laravel.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
