-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'

-- disable tab bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- command palette
-- config.command_palette_bg_color = config.color_schemes['Catppuccin Macchiato'].background

-- font
config.font = wezterm.font('MonaspiceNe Nerd Font')
config.font_size = 14
config.line_height = 1.1

-- disable scroll bar
config.enable_scroll_bar = false

-- disable window padding
config.window_padding = {
  left = '4pt',
  right = '4pt',
  top = '4pt',
  bottom = '4pt',
}

config.window_decorations = 'RESIZE'

-- and finally, return the configuration to wezterm
return config
