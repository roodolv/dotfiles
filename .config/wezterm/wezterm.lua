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

config.status_update_interval = 1000
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
  { label = "LazyGit", args = { "lazygit" } },
}

-- NOTE: Set the gui-window position here
local window_position = "left" -- "left" | "right" | "fullscreen"

wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or { position = { x = 0, y = 0 } })
  local target = wezterm.gui.screens()["active"]

  local ox = wezterm.gui.screens()["origin_x"]
  local oy = wezterm.gui.screens()["origin_y"]
  local vh = wezterm.gui.screens()["virtual_height"]
  local vw = wezterm.gui.screens()["virtual_width"]

  local sub_width = vw - target.width

  local target_is_right = target.width < vw and ox ~= 0
  local target_is_left = target.width < vw and ox == 0

  if target.width < 1920 or window_position == "fullscreen" then -- Check if FHD+ or not
    window:gui_window():maximize()
  elseif target_is_right and window_position == "right" then -- Check if multi-display or not
    window:gui_window():set_position(0, 0)
    window:gui_window():set_inner_size(target.width / 2, target.height - 30)
  elseif target_is_right and window_position == "left" then -- Check if multi-display or not
    window:gui_window():set_position(0 - sub_width / 2, 0)
    window:gui_window():set_inner_size(sub_width / 2, target.height - 30)
  elseif target_is_left and window_position == "right" then -- Check if multi-display or not
    window:gui_window():set_position(target.width, 0)
    window:gui_window():set_inner_size(sub_width / 2, target.height - 30)
  elseif target_is_left and window_position == "left" then -- Check if multi-display or not
    window:gui_window():set_position(target.width / 2, 0)
    window:gui_window():set_inner_size(target.width / 2, target.height - 30)
  elseif window_position == "left" then
    window:gui_window():set_position(0, 0)
    window:gui_window():set_inner_size(target.width / 2, target.height)
  else
    window:gui_window():set_position(target.width / 2, 0)
    window:gui_window():set_inner_size(target.width / 2, target.height)
  end
end)

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config
