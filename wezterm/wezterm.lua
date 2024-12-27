local wezterm = require 'wezterm'
local config = {}

local is_not_a_good_os = function()
  return wezterm.target_triple:find("linux") == nil and wezterm.target_triple:find("darwin") == nil
end

config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'Molokai'
config.font = wezterm.font 'Berkeley Mono'
config.font_size = 16.0

config.window_background_opacity = 0.30

if is_not_a_good_os then
  config.window_background_opacity = 0.85
end

config.default_cursor_style = 'SteadyBar'

config.default_domain = 'WSL:Ubuntu'

return config
