vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
      -- local opts = { silent = true, buffer = bufnr }
      -- vim.keymap.set("n", "<leader>ga", function() vim.cmd.RustLsp('codeAction') end, opts)
    end,
    default_settings = {
      -- rust-analyzer language server config
      ['rust-analyzer'] = {
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}
