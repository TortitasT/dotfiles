return {
  -- LIBRARIES
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
    "rcarriga/nvim-notify"
  },
  {
    "tpope/vim-dotenv"
  },
  --

  -- langkeeper will keep track of the languages you use and the time you spend on them.
  {
    'tortitast/langkeeper.nvim',
    enabled = true,
    -- dir = '/home/tortitas/Git/langkeeper.nvim',
    -- dev = true,
    config = function()
      require 'langkeeper'.setup()
    end
  },

  --
  {
    'TortitasT/coc-intelephense',
    branch = 'fix-composer-psr4',
    build = 'yarn install --frozen-lockfile',
  },

  --
  {
    'dpelle/vim-LanguageTool',
  },

  -- Compatibility with tmux
  {
    "christoomey/vim-tmux-navigator",
  },

  -- LaTeX support
  {
    "lervag/vimtex",
  },

  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
  },

  -- Zig language support
  {
    "ziglang/zig.vim",
  },

  -- OrgMode alternative
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/neorg",
              },
            },
          },
        },
      }
    end,
  },

  -- expJABS will manage your buffers
  -- NOTE: This is a fork of matbme/JABS.nvim that suits my use case better.
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

  -- Noice is the plugin that shows messages as a notification and ex commands in a floating window.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        top_down = false,
        render = "compact",
      })

      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = {
        spelling = {
          enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Dadbod UI is a UI for the dadbod plugin that allows you to run SQL queries on your database.
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
  },

  -- Startify is a plugin that shows a start screen when you open vim.
  {
    "mhinz/vim-startify"
  },

  -- This is the colortheme I use.
  -- {
  --   "kvrohit/mellow.nvim"
  -- },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },

  -- leap.nvim lets you jump through your code with ease.
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
      config = function()
        require('leap').add_default_mappings()
      end
    },
  },

  -- This is the file explorer I use.
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

  -- This plugin allows you to jump to a related file by typing :Other
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

  -- This plugin is the one making the boxes around the code.
  {
    "HampusHauffman/block.nvim",
    config = function()
      require("block").setup({
        automatic = true
      })
    end
  },

  -- Telescope duh
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
  },

  -- This is the plugin that comments lines with "gcc" keymap.
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      -- Allows commenting in multiple languages in the same file (e.g. HTML and JS in a .vue file)
    },
  },

  -- Copilot duh
  { 'github/copilot.vim' },

  -- Treesitter will highlight the code in a better way than vim.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Coc is the plugin that adds LSP support
  {
    'neoclide/coc.nvim',
    branch = "release"
  },

  -- Adds git commands from ex mode
  { 'tpope/vim-fugitive' },

  -- Auto closes brackets
  { 'rstacruz/vim-closer' },

  -- Adds git line status indicators in the current buffer
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
  },

  -- Adds a floating terminal for quick access
  { 'voldikss/vim-floaterm' },

  -- Will track the time you spend on each file
  -- NOTE: Replace with langkeeper when it's ready
  {
    'wakatime/vim-wakatime',
    branch = 'master'
  },

  -- Adds a line indicating indentation
  {
    "lukas-reineke/indent-blankline.nvim",
  },

  -- Blamer will show who wrote each line
  { 'APZelos/blamer.nvim' },

  -- Will preview markdown files
  {
    'iamcco/markdown-preview.nvim',
    build = "cd app && npm i"
  },

  -- Adds :ZenMode command
  { 'folke/zen-mode.nvim' },

  -- Neat Laravel integration with telescope
  {
    "adalessa/laravel.nvim",
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
      {
        "<leader>lt",
        function()
          require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension "laravel"
    end,
  },

  -- Debug Adapter Protocol for Neovim
  { 'mfussenegger/nvim-dap' },

  -- UI for nvim-dap
  {
    'rcarriga/nvim-dap-ui',
    config = function()
      require("dapui").setup()
    end
  },

  -- Paste images in markdown files
  { 'img-paste-devs/img-paste.vim' },

  -- Underline the current word under the cursor
  { 'itchyny/vim-cursorword' }
}
