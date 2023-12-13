return {
  "natecraddock/workspaces.nvim",
  config = function()
    require "workspaces".setup {
      hooks = {
        open = {
          "lua MiniFiles.open()"
        }
      }
    }
    require "telescope".load_extension "workspaces"
  end,
}
