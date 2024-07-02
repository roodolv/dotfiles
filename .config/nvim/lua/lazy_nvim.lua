local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  -- defaults = {
  --   lazy = true,
  -- },
  dev = {
    path = "~/ghq/github.com/roodolv",
    patterns = { "roodolv" },
  },
}

vim.keymap.set("n", "<Leader>L", ":<C-u>Lazy<CR>", { silent = true, desc = "Lazy show" })

require("lazy").setup("plugins", lazy_opts)
-- require("lazy").setup("plugins")
