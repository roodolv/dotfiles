vim.g.mkdp_filetypes = { "markdown" }

local opts = { silent = true, noremap = true }

opts.desc = "MarkdownPreview Toggle"
vim.keymap.set("n", "<Leader>M", ":<C-u>MarkdownPreviewToggle<CR>", opts)
