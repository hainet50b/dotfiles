local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  "Adwaita Mono",
  "Noto Sans Mono CJK JP",
}
config.font_size = 12

config.color_scheme = "Catppuccin Mocha"

return config
