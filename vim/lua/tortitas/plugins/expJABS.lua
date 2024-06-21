-- expJABS will manage your buffers
-- NOTE: This is a fork of matbme/JABS.nvim that suits my use case better.
return {
  'jeff-dh/expJABS.nvim',
  branch = 'expJABS',
  config = function()
    require 'jabs'.setup {
      keymap = {
        close = "D",     -- Close buffer. Default D
        jump = "l",      -- Jump to buffer. Default <cr>
        h_split = "h",   -- Horizontally split buffer. Default s
        v_split = "v",   -- Vertically split buffer. Default v
        preview = "p",   -- Open buffer preview. Default P
      },
    }
  end
}
