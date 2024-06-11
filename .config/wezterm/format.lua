local wezterm = require("wezterm")

local HEADER = "  "

local SYMBOL_COLOR = { "#c090f9", "#a4a4a4" }
local FONT_COLOR = { "#dddddd", "#888888" }
local BACK_COLOR = "#1d1d2d"
local HOVER_COLOR = "#434343"

local function BaseName(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-window-title", function(tab)
  return BaseName(tab.active_pane.foreground_process_name)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local idx = tab.is_active and 1 or 2
  local bg = hover and HOVER_COLOR or BACK_COLOR
  local zoomed = tab.active_pane.is_zoomed and "🔎 " or " "
  return {
    { Foreground = { Color = SYMBOL_COLOR[idx] } },
    { Background = { Color = bg } },
    { Text = HEADER .. zoomed },

    { Foreground = { Color = FONT_COLOR[idx] } },
    { Background = { Color = bg } },
    { Text = tab.active_pane.title },
  }
end)
