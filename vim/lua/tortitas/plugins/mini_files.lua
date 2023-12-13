-- This is the file explorer I use.
return {
  'echasnovski/mini.files',
  version = false,
  config = function()
    require('mini.files').setup({
      options = {
        use_as_default_explorer = false
      }
    })

    -- :w to write to the file system, on key "h" it bugs out
    -- vim.api.nvim_create_autocmd('User', {
    --   pattern = 'MiniFilesBufferCreate',
    --   callback = function()
    --     vim.schedule(function()
    --       vim.api.nvim_buf_set_option(0, 'buftype', 'acwrite')
    --       vim.api.nvim_buf_set_name(0, require('mini.files').get_fs_entry(0, 1).path)
    --       vim.api.nvim_create_autocmd('BufWriteCmd', {
    --         buffer = 0,
    --         callback = function()
    --           require('mini.files').synchronize()
    --         end,
    --       })
    --     end)
    --   end,
    -- })

    -- Close on lost focus
    local minifiles_track_lost_focus = vim.schedule_wrap(function()
      local ft = vim.bo.filetype
      if ft == 'minifiles' or ft == 'minifiles-help' then return end
      local cur_win_id = vim.api.nvim_get_current_win()
      MiniFiles.close()
      pcall(vim.api.nvim_set_current_win, cur_win_id)
    end)

    vim.api.nvim_create_autocmd(
      'BufEnter',
      { callback = minifiles_track_lost_focus, desc = "Close 'mini.files' on lost focus" }
    )
  end
}
