local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--config-precedence",
      "prefer-file",
      -- you can add more global setup here
      "--stdin-filepath",
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
    try_node_modules = true,
  }
end

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
    config = function()
      require('cokeline').setup()
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
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
    'mattn/emmet-vim',
    lazy = false
  },

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

  { 'img-paste-devs/img-paste.vim' },

  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },
  {
    'mhartington/formatter.nvim',
    opts = {
      filetype = {
        vue = { prettier },
        javascript = { prettier },
        typescript = { prettier },
        css = { prettier },
        scss = { prettier },
        json = { prettier },
      }
    }
  }
}
