local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Use a sub-list { { "formatter-a", "formatter-b" } } to run only the first available formatter
    -- lua = { "stylua" },
    rust = { { "rustfmt" } },
    python = { { "ruff_fix", "ruff_format", "prettierd" } },
    javascript = { { "biome", "prettierd" } },
    typescript = { { "biome", "prettierd" } },
    javascriptreact = { { "biome", "prettierd" } },
    typescriptreact = { { "biome", "prettierd" } },
    json = { { "prettierd", "biome" } },
    jsonc = { { "prettierd", "biome" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
