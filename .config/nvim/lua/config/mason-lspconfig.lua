require("mason").setup()
-- START: If the target is not installed when Neovim starts, install it
local registry = require "mason-registry"
local packages = {
  "rust-analyzer",
  "typescript-language-server",
  "lua-language-server",
  "stylua",
}
-- https://github.com/williamboman/mason.nvim/issues/1133#issuecomment-1527888695
registry.refresh(function ()
  for _, pkg_name in ipairs(packages) do
    local pkg = registry.get_package(pkg_name)
    if not pkg:is_installed() then
      pkg:install()
    end
  end
end)
-- END
require("mason-lspconfig").setup()
-- require("mason-lspconfig").setup_handlers({
--   function(server_name)
--     require("lspconfig")[server_name].setup({})
--   end
-- })
