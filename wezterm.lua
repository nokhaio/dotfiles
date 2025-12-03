-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 150
config.initial_rows = 48

-- or, changing the font size and color scheme.
config.font_size = 14
config.font = wezterm.font 'Fira Code'
-- config.font = wezterm.font("Fira Code", { italic = true })

-- config.color_scheme = "AdventureTime"

-- Finally, return the configuration to wezterm:
return config
