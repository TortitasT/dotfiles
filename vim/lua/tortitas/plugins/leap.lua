-- leap.nvim lets you jump through your code with ease.
return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
    config = function()
      require('leap').add_default_mappings()
    end
  },
}
