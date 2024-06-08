local bufferline = require("bufferline")

bufferline.setup({
  options = {
    -- mode = "buffers", -- NOTE: set "buffers" for "BufferLineMoveXXX" commands
    mode = "tabs",
    separator_style = "slant",
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    },
    themable = true,
    -- mouse operation
    right_mouse_command = nil,
    left_mouse_command = nil,
    -- indicator
    numbers = "ordinal",
    indicator = {
      icon = "▎",
      style = "underline", -- "icon" | "underline" | "none",
    },
    show_buffer_close_icons = false,
    -- icon-type
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    -- size/length
    tab_size = 18,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true,
    -- diagnostics
    diagnostics = function()
      if vim.fn.has("win32") then
        return "nvim_lsp"
      else
        return false
      end
    end,
    diagnostics_update_in_insert = true,
    -- hover
    hover = {
      enabled = true,
      delay = 150,
      reveal = { "close" },
    },
  },
})

-- keymaps
local opts = { silent = true, noremap = true }

----- for "buffers" mode
-- vim.keymap.set("n", "<Leader>>>", ":<C-u>BufferLineMoveNext<CR>", opts)
-- vim.keymap.set("n", "<Leader><<", ":<C-u>BufferLineMovePrev<CR>", opts)
-- vim.keymap.set("n", "<Leader>bp", ":<C-u>BufferLineTogglePin<CR>", opts)

----- for "tabs" mode
vim.keymap.set("n", "<C-Right>", ":<C-u>BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":<C-u>BufferLineCyclePrev<CR>", opts)
