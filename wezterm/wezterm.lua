local wezterm = require 'wezterm'
local config = {}

config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'Molokai'
config.font = wezterm.font 'Go Mono Nerd Font'
config.font_size = 16.0

config.window_background_opacity = 0.30

config.default_cursor_style = 'SteadyBar'

return config
