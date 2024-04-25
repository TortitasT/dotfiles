-- langkeeper will keep track of the languages you use and the time you spend on them.
return {
  'tortitast/langkeeper.nvim',
  enabled = false,
  dev = false,
  config = function()
    require 'langkeeper'.setup()
  end
}
