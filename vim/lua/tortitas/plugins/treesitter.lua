-- Treesitter will highlight the code in a better way than vim.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- require 'nvim-treesitter.install'.compilers = { "clang" } -- Must use llvm `scoop install llvm` https://github.com/nvim-treesitter/nvim-treesitter/issues/1897

    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "tsx",
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
        "markdown",
        "markdown_inline",
        "heex",
        "elixir",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {
          "latex", -- Vimtex already does this
        },
      },
      indent = { enable = true },
    })

    -- vim.filetype.add({ extension = { mdx = 'mdx' } })
    -- require("nvim-treesitter.parsers").filetype_to_parsername.mdx = "markdown"

    -- Blade
    -- https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade"
    }
  end,
}
