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
          hijack_netrw_behavior = "disabled",
          filtered_items        = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
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
    "mhinz/vim-startify"
  },

  {
    "kvrohit/mellow.nvim"
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
      config = function()
        require('leap').add_default_mappings()
      end
    },
  },

  {
    'echasnovski/mini.files',
    version = false,
    config = function()
      require('mini.files').setup()
    end
  },

  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          -- Laravel
          "laravel",
          {
            pattern = "/src/(.*).php$",
            target = "/tests/Feature/%1Test.php",
            context = "test",
          },
          {
            pattern = "/tests/Feature/(.*)Test.php$",
            target = "/src/%1.php",
            context = "controller",
          },
        }
      })
    end
  },

  {
    "HampusHauffman/block.nvim",
    config = function()
      require("block").setup({
        automatic = true
      })
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  { "smartpde/telescope-recent-files" },

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

  {
    'mattn/emmet-vim',
    lazy = false
  },

  { 'tpope/vim-fugitive' },  -- Adds git operations integration

  { 'rstacruz/vim-closer' }, -- Autocloses brackets

  -- { 'mhinz/vim-signify' }, -- Adds signs in files for git

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs                        = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm                         = {
          enable = false
        },
      }
    end
  }, -- Adds signs in files for git

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

  { 'mfussenegger/nvim-dap' },

  { 'img-paste-devs/img-paste.vim' },

  { 'nagy135/typebreak.nvim' },

  { 'itchyny/vim-cursorword' }
}
