return {
  {
    -- colorscheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    "mhinz/vim-startify",
    lazy = false,
    priority = 1000,
    config = function()
      require('config/vim-startify')
    end
  },
}
