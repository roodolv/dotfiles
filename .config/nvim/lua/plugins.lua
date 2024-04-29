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
      require("config/startify")
    end
  },
  -- view
  {
    "simeji/winresizer",
    event = "VimEnter",
    config = function()
      require("config/winresizer")
    end,
  },
  {
    "Yggdroot/indentLine",
    event = "BufRead",
    config = function()
      require("config/indentline")
    end,
  },
  {
    "preservim/tagbar",
    event = "BufRead",
    config = function()
      require("config/tagbar")
    end,
  },
  -- editing
  {
    "easymotion/vim-easymotion",
    event = "BufRead",
    config = function()
      require("config/easymotion")
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
    event = "BufRead",
    config = function()
      require("config/sandwich")
    end,
  },
  {
    "tpope/vim-repeat",
    event = "BufEnter",
    dependencies = {
      "tpope/vim-surround",
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
    event = "BufRead",
  },
  {
    "bronson/vim-trailing-whitespace",
    event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>T', ':<C-u>FixWhitespace<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "tomtom/tcomment_vim",
    event = "BufRead",
    config = function()
      require("config/tcomment")
    end,
  },
}
