local trouble = require("trouble")

trouble.setup({
  -- keys = {
  --   ["?"] = "help",
  --   r = "refresh",
  --   R = "toggle_refresh",
  --   q = "close",
  --   o = "jump_close",
  --   ["<esc>"] = "cancel",
  --   ["<cr>"] = "jump",
  --   ["<2-leftmouse>"] = "jump",
  --   ["<c-s>"] = "jump_split",
  --   ["<c-v>"] = "jump_vsplit",
  --   -- go down to next item (accepts count)
  --   -- j = "next",
  --   ["}"] = "next",
  --   ["]]"] = "next",
  --   -- go up to prev item (accepts count)
  --   -- k = "prev",
  --   ["{"] = "prev",
  --   ["[["] = "prev",
  --   i = "inspect",
  --   p = "preview",
  --   P = "toggle_preview",
  --   zo = "fold_open",
  --   zO = "fold_open_recursive",
  --   zc = "fold_close",
  --   zC = "fold_close_recursive",
  --   za = "fold_toggle",
  --   zA = "fold_toggle_recursive",
  --   zm = "fold_more",
  --   zM = "fold_close_all",
  --   zr = "fold_reduce",
  --   zR = "fold_open_all",
  --   zx = "fold_update",
  --   zX = "fold_update_all",
  --   zn = "fold_disable",
  --   zN = "fold_enable",
  --   zi = "fold_toggle_enable",
  -- },
})

local opts = {}

opts.desc = "LSP References (Trouble)"
vim.keymap.set("n", "<Leader>xr", ":<C-u>Trouble lsp_references toggle focus=false<CR>", opts)

opts.desc = "Diagnostics (Trouble)"
vim.keymap.set("n", "<Leader>xx", ":<C-u>Trouble diagnostics toggle<CR>", opts)
opts.desc = "Buffer Diagnostics (Trouble)"
vim.keymap.set("n", "<Leader>xX", ":<C-u>Trouble diagnostics toggle filter.buf=0<CR>", opts)

opts.desc = "Symbols (Trouble)"
vim.keymap.set("n", "<Leader>xs", ":<C-u>Trouble symbols toggle focus=false<CR>", opts)
opts.desc = "LSP Definitions / references / ... (Trouble)"
vim.keymap.set("n", "<Leader>xl", ":<C-u>Trouble lsp toggle focus=false win.position=right<CR>", opts)

opts.desc = "Quickfix List (Trouble)"
vim.keymap.set("n", "<Leader>xQ", ":<C-u>Trouble qflist toggle<CR>", opts)
opts.desc = "Location List (Trouble)"
vim.keymap.set("n", "<Leader>xL", ":<C-u>Trouble loclist toggle<CR>", opts)
