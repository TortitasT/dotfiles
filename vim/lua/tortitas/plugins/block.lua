-- This plugin is the one making the boxes around the code.
return {
  "HampusHauffman/block.nvim",
  enabled = false,
  config = function()
    require("block").setup({
      automatic = true
    })
  end
}
