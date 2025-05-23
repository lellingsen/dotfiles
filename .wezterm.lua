-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'Catppuccin Frappe' --  'Catppuccin Frappe', 'Dracula (Official)', 'Everforest Dark (Gogh)', 'nordfox', 'GruvboxDark', 'nord', 'Catppuccin Macchiato (Gogh)', 'nordic' (added custom)
config.font_size = 19
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
--config.window_background_opacity = 0.85
config.adjust_window_size_when_changing_font_size = false
config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {
        key="LeftArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bb"}
    },
    -- Make Option-Right equivalent to Alt-f; forward-word
    {
        key="RightArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bf"}
    },
}
config.max_fps = 120
config.animation_fps = 30

-- and finally, return the configuration to wezterm
return config

