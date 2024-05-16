local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local biome_support_filetypes = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "json",
  "jsonc",
}

-- install packages for null-ls with mason.nvim
require("mason-null-ls").setup({
  ensure_installed = {
    "astro-language-server",
    "bash-language-server",
    "biome",
    "css-lsp",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "emmet-ls",
    -- "gopls", -- NOTE: failed to install
    "graphql-language-service-cli",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "prettierd",
    "tailwindcss-language-server",
    "typescript-language-server",
  },
  automatic_installation = true,
  handlers = {},
})

-- ts-node-action keymap
vim.keymap.set("n", "ga", require("ts-node-action").node_action, { desc = "Trigger TreeSitter Node Action" })

null_ls.setup({
  sources = {
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.ts_node_action,
    null_ls.builtins.formatting.biome.with({
      only_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        -- if biome doesn't support buf-filetype & root has prettier settings
        if not vim.tbl_contains(biome_support_filetypes, vim.bo.filetype) then
          return true
        end
        return not utils.root_has_file({ "biome.json" })
      end,
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            async = false,
            -- prevent double-formatting
            filter = function(c)
              local disabled_format_clients = { "lua_ls", "tsserver" }
              return not vim.tbl_contains(disabled_format_clients, c.name)
            end,
          })
        end,
      })
    end
  end,
})
