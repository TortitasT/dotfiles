return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = true,
        window = {
          position = "right",
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              --auto close
              require("neo-tree").close_all()
            end
          },
        }
      })
    end
  },

  {
    'willothy/nvim-cokeline',
    --    dependencies = {
    --      'kyazdani42/nvim-web-devicons',
    --    },
    config = function()
      require('cokeline').setup()
    end
  },

  -- {
  --   "catppuccin/vim",
  --   name = catppuccin
  -- },

  {
    "kvrohit/mellow.nvim"
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  { 'github/copilot.vim' },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  {
    'neoclide/coc.nvim',
    branch = "release"
  },

  { 'mattn/emmet-vim' },

  { 'tpope/vim-fugitive' },

  { 'rstacruz/vim-closer' },

  { 'mhinz/vim-signify' },

  { 'mhinz/vim-startify' },

  { 'voldikss/vim-floaterm' },

  { 
    'wakatime/vim-wakatime',
    branch = 'master' 
  },

  { 'ap/vim-css-color' },

  -- { 'yggdroot/indentline' },
  { 
    "lukas-reineke/indent-blankline.nvim", 
    config = function()
    end
  },

  { 'APZelos/blamer.nvim' },

  {
    'iamcco/markdown-preview.nvim',
    build = "cd app && yarn install"
  },

  { 'folke/zen-mode.nvim' },

  { 'adalessa/laravel.nvim' },
  --{
  --  'VonHeikemen/lsp-zero.nvim',
  --  branch = 'v2.x',
  --  dependencies = {
  --    {'neovim/nvim-lspconfig'},
  --    {
  --      'williamboman/mason.nvim',
  --      build = function()
  --        pcall(vim.cmd, 'MasonUpdate')
  --      end,
  --    },
  --    {'williamboman/mason-lspconfig.nvim'},
  --    {'hrsh7th/nvim-cmp'},
  --    {'hrsh7th/cmp-nvim-lsp'},
  --    {'L3MON4D3/LuaSnip'},
  --  }
  --}
}
