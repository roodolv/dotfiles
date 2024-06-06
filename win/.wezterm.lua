local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight"
config.window_background_opacity = 0.95
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.font = wezterm.font("HackGen Console NF")
config.font_size = 17

-- config.default_prog = { "wsl.exe", "--distribution", "ubuntu", "--cd", "~" }
config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }

return config
