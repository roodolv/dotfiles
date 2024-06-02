local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- { { "A", "B" } } runs only the first available formatter
    lua = { { "stylua" } },
    rust = { { "rustfmt" } },
    python = { { "ruff_fix", "ruff_format" } },
    javascript = { { "biome", "prettierd" } },
    typescript = { { "biome", "prettierd" } },
    javascriptreact = { { "biome" } },
    typescriptreact = { { "biome" } },
    json = { { "biome" } },
    jsonc = { { "biome" } },
    yaml = { { "prettierd", "biome" } },
    html = { { "prettierd", "biome" } },
    css = { { "prettierd", "biome" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
