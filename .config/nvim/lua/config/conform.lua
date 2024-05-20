local conform = require("conform")
-- local formatters = conform.formatters
-- REVIEW: determine which to use
-- local util = require("conform.util")
-- local util = require "conform.util"
-- local util = conform.util

conform.setup({
  formatters_by_ft = {
    -- Use a sub-list { { "formatter-a", "formatter-b" } } to run only the first available formatter
    -- lua = { "stylua" },
    rust = { "rustfmt" },
    -- javascript = { { "biome", "prettierd" } },
    -- typescript = { { "biome", "prettierd" } },
    -- javascriptreact = { { "biome", "prettierd" } },
    -- typescriptreact = { { "biome", "prettierd" } },
    -- json = { { "biome", "prettierd" } },
    -- jsonc = { { "biome", "prettierd" } },
    -- python = { { "ruff_fix", "ruff_format" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- -- format on save(alternative)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     conform.format({ bufnr = args.buf })
--   end,
-- })

-- -- formatter: Ruff
-- formatters.yamlfix = function(bufnr)
--   return {
--     command = util.find_executable({
--       "local/path/yamlfix",
--     }, "yamlfix"),
--     env = {
--       RUFF_FIX_SEQUENCE_STYLE = "block_style",
--     },
--   }
-- end
