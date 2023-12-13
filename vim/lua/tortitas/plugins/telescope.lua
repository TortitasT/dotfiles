-- Telescope duh
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  config = function()
    require('telescope').setup {
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
  end,
}
