local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function is_macos()
	return wezterm.target_triple:find("darwin") ~= nil
end

local fish_bin = is_macos() and "/opt/homebrew/bin/fish" or "/bin/fish"
config.default_prog = { fish_bin }

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = is_macos() and 14 or 12
config.line_height = 1.1

config.color_scheme = "Catppuccin Macchiato"

config.enable_tab_bar = false
config.use_fancy_tab_bar = false

config.window_decorations = "MACOS_FORCE_DISABLE_SHADOW|RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 20

local padding = "4pt"
config.window_padding = { left = padding, right = padding, top = padding, bottom = padding }

config.audible_bell = "Disabled"

return config
