require("mason").setup()
-- START: If the target is not installed when Neovim starts, install it
local registry = require "mason-registry"
local packages = {
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
  -- "stylua",
  "tailwindcss-language-server",
  "typescript-language-server",
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
