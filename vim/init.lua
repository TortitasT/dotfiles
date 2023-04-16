-- This file is heavily based on the init.lua file from https://github.com/jdhao/nvim-config/blob/master/init.lua thanks to @jdhao for the great work!

local api = vim.api
local version = vim.version

-- check if we have the latest stable version of nvim
local expected_ver = "0.9.0"
local ev = version.parse(expected_ver)
local actual_ver = version()

if version.cmp(ev, actual_ver) ~= 0 then
  local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
  local msg = string.format("Unsupported nvim version: expect %s, but got %s instead!", expected_ver, _ver)
  api.nvim_err_writeln(msg)
  return
end

require("tortitas/lazy")

local core_conf_files = {
  "main.vim",
  "mappings.vim",
}

-- source all the core config files
for _, name in ipairs(core_conf_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end
