-- Mappings
vim.api.nvim_set_keymap('n', '<Leader>R', ':<C-u>WinResizerStartResize<CR>', { noremap = true, silent = true })

-- Options
vim.g.winresizer_start_key = '<Leader>R'
vim.g.winresizer_vert_resize = 5
vim.g.winresizer_horiz_resize = 3
vim.g.winresizer_finish_with_escape = 0
vim.g.winresizer_keycode_cancel = 27
