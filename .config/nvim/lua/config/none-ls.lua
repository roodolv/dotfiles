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

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.biome.with({
      only_local = "node_modules/.bin",
      condition = function(utils)
        -- use biome if biome does support filetype
        if not vim.tbl_contains(biome_support_filetypes, vim.bo.filetype) then
          return false
        end
        -- use biome if biome.json does not exist
        return utils.root_has_file({ "biome.json" })
      end,
    }),
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        -- use prettier if biome does not support filetype
        if not vim.tbl_contains(biome_support_filetypes, vim.bo.filetype) then
          return true
        end
        -- use prettier if biome.json does not exist
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
