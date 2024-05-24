local lspsaga = require("lspsaga")

lspsaga.setup({
  code_action = {
    extend_gitsigns = true,
  },
  diagnostic = {
    extend_relatedInformation = true,
    extend_gitsigns = true,
    show_source = true,
  },
  finder = {
    keys = {
      shuttle = "[w",
      toggle_or_open = "<CR>",
      vsplit = "<C-v>",
      split = "<C-h>",
      tabe = "<C-t>",
      tabnew = "r",
      quit = "q",
      close = "<C-c><C-c>",
    },
  },
  lightbulb = {
    enable = true,
    sign = false,
  },
  rename = {
    keys = {
      quit = "<C-c>",
    }
  },
  outline = {
    keys = {
      toggle_or_jump = "<CR>",
    },
  },
  symbol_in_winbar = {
    enable = false,
  },
})

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

opts.desc = "Lspsaga Show hover docs"
keymap.set("n", "K", ":<C-u>Lspsaga hover_doc<CR>", opts)
opts.desc = "Lspsaga Show code actions"
keymap.set("n", "gA", ":<C-u>Lspsaga code_action<CR>", opts)
opts.desc = "Lspsaga Peek definitions"
keymap.set("n", "gd", ":<C-u>Lspsaga peek_definition<CR>", opts)
opts.desc = "Lspsaga Peek type definitions"
keymap.set("n", "gD", ":<C-u>Lspsaga peek_type_definition<CR>", opts)
opts.desc = "Lspsaga Go to definitions"
keymap.set("n", "<Leader>gd", ":<C-u>Lspsaga goto_definition<CR>", opts)
opts.desc = "Lspsaga Go to type definitions"
keymap.set("n", "<Leader>gD", ":<C-u>Lspsaga goto_type_definition<CR>", opts)
opts.desc = "Lspsaga Rename"
keymap.set("n", "<F2>", ":<C-u>Lspsaga rename<CR>", opts)
opts.desc = "Lspsaga Go to next diagnostic information"
keymap.set("n", "]d", ":<C-u>Lspsaga diagnostic_jump_next<CR>", opts)
opts.desc = "Lspsaga Go to prev diagnostic information"
keymap.set("n", "[d", ":<C-u>Lspsaga diagnostic_jump_prev<CR>", opts)
opts.desc = "Lspsaga Show finder"
keymap.set("n", "<leader>F", ":<C-u>Lspsaga finder<CR>", opts)
opts.desc = "Lspsaga Show outline"
keymap.set("n", "<leader>O", ":<C-u>Lspsaga outline<CR>", opts)
