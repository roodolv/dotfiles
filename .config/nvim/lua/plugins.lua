return {
  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  -- startup
  {
    "mhinz/vim-startify",
    lazy = false,
    priority = 1000,
    config = function()
      require("config/vim-startify")
    end
  },
  -- editing
  {
    "machakann/vim-sandwich",
    lazy = true,
    priority = 1000,
    event = "BufEnter",
    config = function()
      require("config/vim-sandwich")
    end
  },
  {
    "easymotion/vim-easymotion",
    lazy = true,
    priority = 1000,
    event = "BufEnter",
    config = function()
      require("config/vim-easymotion")
    end
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      vim.api.nvim_set_keymap('n', '<Leader>gu', ':<C-u>UndotreeToggle<CR>', { noremap = true, silent = true })
    end,
    config = function()
      require("config/undotree")
    end,
  },
}
