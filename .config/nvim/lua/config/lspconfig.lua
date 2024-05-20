vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf, desc = "" }
    vim.keymap.set('n', 'gf', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = opts.buffer, desc = "LSP format" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = opts.buffer, desc = "LSP hover" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = opts.buffer, desc = "LSP references" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = opts.buffer, desc = "LSP definition" })
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, { buffer = opts.buffer, desc = "LSP type_definition" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = opts.buffer, desc = "LSP implementation" })
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { buffer = opts.buffer, desc = "LSP rename" })
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { buffer = opts.buffer, desc = "LSP code_action" })
    vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, { buffer = opts.buffer, desc = "LSP signature_help" })
    vim.keymap.set('n', 'gQ', vim.diagnostic.setqflist, { buffer = opts.buffer, desc = "LSP send diag to QuickFix" })
    vim.keymap.set('n', 'gL', vim.diagnostic.setloclist, { buffer = opts.buffer, desc = "LSP send diag to loclist" })
    vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, { buffer = opts.buffer, desc = "LSP goto_next diag" })
    vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, { buffer = opts.buffer, desc = "LSP goto_prev diag" })
  end,
})
