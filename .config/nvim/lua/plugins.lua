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
  -- view (pane/tab/window)
  {
    "simeji/winresizer",
    cmd = "WinResizerStartResize",
    init = function()
      vim.api.nvim_set_keymap('n', '<Leader>R', ':<C-u>WinResizerStartResize<CR>', { noremap = true, silent = true })
    end,
    config = function()
      require("config/winresizer")
    end,
  },
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    init = function()
      vim.api.nvim_set_keymap('n', '<Leader>gt', ':<C-u>TagbarToggle<CR>', { noremap = true, silent = true })
    end,
    config = function()
      require("config/tagbar")
    end,
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
  -- search/filer
  {
    "ibhagwan/fzf-lua",
    event = "VimEnter",
    dependencies = {
      "junegunn/fzf",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config/fzf-lua")
    end
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   event = "VimEnter",
  --   dependencies = {
  --     "junegunn/fzf",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("config/nvim-tree")
  --   end
  -- },

  -- syntax/indentation
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    config = function()
      require("config/nvim-treesitter")
    end,
  },
  {
    "Yggdroot/indentLine",
    event = "BufRead",
    config = function()
      require("config/indentline")
    end,
  },

  -- LSP

  -- AGI
  -- repo = 'Exafunction/codeium.vim'
  -- on_event = 'BufRead'
  -- # hook_add = 'source ~/.config/nvim/plugins/codeium-vim.rc.vim'

  -- Git
  -- repo = 'rhysd/git-messenger.vim'
  -- on_cmd = 'GitMessenger'
  -- on_map = '<Plug>(git-messenger'
  -- hook_add = '''
  --   nnoremap <silent> <Leader>gm :<C-u>GitMessenger<CR>
  -- '''
  -- hook_source = 'source ~/.config/nvim/plugins/git-messenger.rc.vim'

  -- editing
  {
    "easymotion/vim-easymotion",
    event = "BufRead",
    config = function()
      require("config/easymotion")
    end
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
