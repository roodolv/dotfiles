local wezterm = require("wezterm")

local SYMBOL = "  "
local SYMBOL_COLOR = { "#c090f9", "#a4a4a4" }
local FG_COLOR = { "#dddddd", "#888888" }
local BG_COLOR = "#1d1d2d"
local HOVER_COLOR = "#434343"

local function basename(s)
  local name = string.gsub(s, "(.*[/\\])(.*)", "%2")
  return name:match("(.+)%..+") or name
end

wezterm.on("format-window-title", function(tab)
  return basename(tab.active_pane.foreground_process_name)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local idx = tab.is_active and 1 or 2
  local bg = hover and HOVER_COLOR or BG_COLOR
  local pane = tab.active_pane
  local zoomed = pane.is_zoomed and "🔎 " or " "
  local title = basename(pane.foreground_process_name)
  return {
    { Foreground = { Color = SYMBOL_COLOR[idx] } },
    { Background = { Color = bg } },
    { Text = " " .. SYMBOL .. zoomed },

    { Foreground = { Color = FG_COLOR[idx] } },
    { Background = { Color = bg } },
    { Text = title .. " " },
  }
end)
