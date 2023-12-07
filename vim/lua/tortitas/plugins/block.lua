-- This plugin is the one making the boxes around the code.
return {
  "HampusHauffman/block.nvim",
  config = function()
    require("block").setup({
      automatic = true
    })
  end
}
