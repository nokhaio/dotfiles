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

config.scrollback_lines = 1000 -- default 10000+
config.window_background_opacity = 1.0 -- Отключи прозрачность и эффекты
config.use_fancy_tab_bar = false -- Отключи fancy tab bar
config.max_fps = 60 -- частоту рендера
-- config.front_end = "Software" -- Отключи GPU (default "OpenGL")
config.hide_tab_bar_if_only_one_tab = true
-- config.enable_tab_bar = false
config.show_tab_index_in_tab_bar = false

-- config.color_scheme = "AdventureTime"

config.color_scheme = 'ayu'
config.color_scheme = 'Ayu Dark (Gogh)'






-- Finally, return the configuration to wezterm:
return config
