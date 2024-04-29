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
    config = function()
      require("config/vim-startify")
    end
  },
  -- editing
  {
    "easymotion/vim-easymotion",
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
  {
    "machakann/vim-sandwich",
    event = "BufEnter",
    config = function()
      require("config/vim-sandwich")
    end,
  },
  {
    "tpope/vim-repeat",
    event = "BufEnter",
    dependencies = {
      "tpope/vim-surround",
      "tpope/vim-unimpaired",
    },
  },
  {
    "kana/vim-operator-replace",
    event = "BufEnter",
    dependencies = {
      "kana/vim-operator-user",
    },
    config = function()
      vim.api.nvim_set_keymap('n', "'", '<Plug>(operator-replace)', { noremap = true })
    end,
  },
  {
    "jiangmiao/auto-pairs",
    event = "BufEnter",
  },
  {
    "bronson/vim-trailing-whitespace",
    event = "BufEnter",
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>T', ':<C-u>FixWhitespace<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "tomtom/tcomment_vim",
    event = "BufEnter",
    config = function()
      require("config/tcomment_vim")
    end,
  },
}
