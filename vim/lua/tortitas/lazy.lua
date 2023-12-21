-- This files bootstraps lazy.nvim and loads it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local os = vim.loop.os_uname().sysname
local dev_path = ""

if os == "Darwin" then
  dev_path = "/Users/vgf/Documents/Git/misc"
elseif os == "Linux" then
  dev_path = "/home/tortitas/Git"
end

require("lazy").setup("tortitas/plugins", {
  dev = {
    path = dev_path,
  }
})
