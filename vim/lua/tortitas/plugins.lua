return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "MunifTanjim/nui.nvim",
  },

  {
    'tortitast/langkeeper.nvim',
    -- dir = '/home/tortitas/Git/langkeeper.nvim',
    -- dev = true,
    config = function()
      require 'langkeeper'.setup()
    end
  },

  {
    'jeff-dh/expJABS.nvim',
    branch = 'expJABS',
    config = function()
      require 'jabs'.setup {
        keymap = {
          close = "q",   -- Close buffer. Default D
          jump = "l",    -- Jump to buffer. Default <cr>
          h_split = "h", -- Horizontally split buffer. Default s
          v_split = "v", -- Vertically split buffer. Default v
          preview = "p", -- Open buffer preview. Default P
        },
      }
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
      require('mini.files').setup({
        options = {
          use_as_default_explorer = false
        }
      })

      -- :w to write to the file system, on key "h" it bugs out
      -- vim.api.nvim_create_autocmd('User', {
      --   pattern = 'MiniFilesBufferCreate',
      --   callback = function()
      --     vim.schedule(function()
      --       vim.api.nvim_buf_set_option(0, 'buftype', 'acwrite')
      --       vim.api.nvim_buf_set_name(0, require('mini.files').get_fs_entry(0, 1).path)
      --       vim.api.nvim_create_autocmd('BufWriteCmd', {
      --         buffer = 0,
      --         callback = function()
      --           require('mini.files').synchronize()
      --         end,
      --       })
      --     end)
      --   end,
      -- })

      -- Close on lost focus
      local minifiles_track_lost_focus = vim.schedule_wrap(function()
        local ft = vim.bo.filetype
        if ft == 'minifiles' or ft == 'minifiles-help' then return end
        local cur_win_id = vim.api.nvim_get_current_win()
        MiniFiles.close()
        pcall(vim.api.nvim_set_current_win, cur_win_id)
      end)

      vim.api.nvim_create_autocmd(
        'BufEnter',
        { callback = minifiles_track_lost_focus, desc = "Close 'mini.files' on lost focus" }
      )
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

  {
    'rcarriga/nvim-dap-ui',
    config = function()
      require("dapui").setup()
    end
  },

  { 'img-paste-devs/img-paste.vim' },

  { 'nagy135/typebreak.nvim' },

  { 'itchyny/vim-cursorword' }
}
