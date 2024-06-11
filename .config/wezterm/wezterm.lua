local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("format")
require("status")

config.color_scheme = "tokyonight"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- config.status_update_interval = 1000
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
-- config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
  font_size = 13,
}

config.text_background_opacity = 0.85
config.font = wezterm.font("HackGen Console NF")
config.font_size = 17

config.default_prog = { "bash" }
-- config.default_prog = { "pwsh" }
-- config.default_prog = { "wsl", "--distribution", "ubuntu", "--cd", "~" }

config.launch_menu = {
  { label = "Neovim", args = { "nvim" } },
  { label = "PowerShell 7", args = { "pwsh" } },
  { label = "Bash", args = { "bash" } },
  {
    label = "WSL2",
    args = { "wsl", "--distribution", "ubuntu", "--cd", "~" },
  },
  { label = "Command Prompt", args = { "cmd.exe" } },
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config
