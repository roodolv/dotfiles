require("mason").setup()
-- START: If the target is not installed when Neovim starts, install it
local registry = require "mason-registry"
local packages = {
  -- "bash-language-server",
  -- "biome",
  -- "css-lsp",
  -- "html-lsp",
  -- "json-lsp",
  -- "lua-language-server",
  -- "prettierd",
  -- "ruff",
  -- "stylua",
  -- "typescript-language-server",
}
-- https://github.com/williamboman/mason.nvim/issues/1133#issuecomment-1527888695
registry.refresh(function()
  for _, pkg_name in ipairs(packages) do
    local pkg = registry.get_package(pkg_name)
    if not pkg:is_installed() then
      pkg:install()
    end
  end
end)
-- END

require("mason-lspconfig").setup()
