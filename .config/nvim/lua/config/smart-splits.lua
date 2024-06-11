local smart_splits = require("smart-splits")

smart_splits.setup({
  ignored_filetypes = { "nofile", "quickfix", "prompt", "TelescopePrompt" },
  resize_mode = {
    silent = true,
    hooks = {
      on_enter = function()
        vim.notify("Entering resize mode")
      end,
      on_leave = function()
        vim.notify("Exiting resize mode, bye")
      end,
    },
  },
})

----- resizing splits
-- for example `10<C-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right)

----- moving between splits
vim.keymap.set("n", "<M-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<M-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<M-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<M-l>", require("smart-splits").move_cursor_right)
-- vim.keymap.set("n", "<M-\\>", require("smart-splits").move_cursor_previous)

----- swapping buffers between windows
vim.keymap.set("n", "<Leader><Leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<Leader><Leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<Leader><Leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<Leader><Leader>l", require("smart-splits").swap_buf_right)
