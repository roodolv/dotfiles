vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
      local navbuddy = require("nvim-navbuddy")
      navbuddy.attach(client, bufnr)
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
