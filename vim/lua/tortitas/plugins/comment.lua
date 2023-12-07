-- This is the plugin that comments lines with "gcc" keymap.
return {
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
}
