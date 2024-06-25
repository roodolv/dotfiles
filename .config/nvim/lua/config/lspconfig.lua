local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

----- Setup lspconfig
-- NOTE: servers: "nvim-data/lazy/nvim-lspconfig/doc/server_configurations.md"
local servers = {
  "lua_ls",
  "bashls",
  "jsonls",
  "html",
  "cssls",
  "marksman",
  "ruff_lsp",
  "tsserver",
  -- 'biome',
}

-- Setup neodev before lspconfig
require("neodev").setup({
  -- enable type-checking for nvim-dap-ui
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Setup language servers
local navbuddy = require("nvim-navbuddy")
local on_attach = function(client, bufnr)
  navbuddy.attach(client, bufnr)
  if client.name == "ruff_lsp" then
    -- Disable hover in favor of Other client
    client.server_capabilities.hoverProvider = false
  end
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

----- Setup autocmd
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    local keymap = vim.keymap
    local opts = { buffer = ev.buf }

    -- keymaps
    opts.desc = "NativeLSP format"
    keymap.set("n", "gf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    -- opts.desc = "NativeLSP hover"
    -- keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    opts.desc = "NativeLSP references"
    keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- opts.desc = "NativeLSP definition"
    -- keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- opts.desc = "NativeLSP type_definition"
    -- keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    opts.desc = "NativeLSP implementation"
    keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- opts.desc = "NativeLSP rename"
    -- keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    -- opts.desc = "NativeLSP code_action"
    -- keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    -- opts.desc = "NativeLSP signature_help"
    -- keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
    opts.desc = "NativeLSP send diag to QuickFix"
    keymap.set("n", "gQ", vim.diagnostic.setqflist, opts)
    opts.desc = "NativeLSP send diag to loclist"
    keymap.set("n", "gL", vim.diagnostic.setloclist, opts)
    -- opts.desc = "NativeLSP goto_next diag"
    -- keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    -- opts.desc = "NativeLSP goto_prev diag"
    -- keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

    opts.desc = "NativeLSP toggle inlay hints"
    keymap.set("n", "gH", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
    end, opts)

    -- lspconfig commands
    opts.desc = "LspInfo"
    keymap.set("n", "<Leader>li", ":<C-u>LspInfo<CR>", opts)
    opts.desc = "LspLog"
    keymap.set("n", "<Leader>lL", ":<C-u>LspLog<CR>", opts)
    opts.desc = "LspStart"
    keymap.set("n", "<Leader>lS", ":<C-u>LspStart<CR>", opts)
    opts.desc = "LspStop"
    keymap.set("n", "<Leader>ls", ":<C-u>LspStop<CR>", opts)
    opts.desc = "LspRestart"
    keymap.set("n", "<Leader>lr", ":<C-u>LspRestart<CR>", opts)
  end,
})
