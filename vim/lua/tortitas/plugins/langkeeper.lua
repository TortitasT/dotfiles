-- langkeeper will keep track of the languages you use and the time you spend on them.
return {
  'tortitast/langkeeper.nvim',
  enabled = true,
  -- dir = '/home/tortitas/Git/langkeeper.nvim',
  -- dev = true,
  config = function()
    require 'langkeeper'.setup()
  end
}
