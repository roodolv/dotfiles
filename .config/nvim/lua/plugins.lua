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
  -- pane/tab/window
  {
    "simeji/winresizer",
    keys = {
      { "<Leader>R", ':<C-u>WinResizerStartResize<CR>', mode = 'n', silent = true },
    },
    config = function()
      require("config/winresizer")
    end,
  },
  {
    "preservim/tagbar",
    keys = {
      { "<Leader>gt", ':<C-u>TagbarToggle<CR>', mode = 'n', silent = true },
    },
    config = function()
      require("config/tagbar")
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<Leader>gu", ':<C-u>UndotreeToggle<CR>', mode = 'n', silent = true },
    },
    config = function()
      require("config/undotree")
    end,
  },
  -- search/navigation
  -- {
  --   "ibhagwan/fzf-lua",
  --   event = "VimEnter",
  --   dependencies = {
  --     "junegunn/fzf",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {},
  --   config = function()
  --     require("config/fzf-lua")
  --   end
  -- },
  -- filer/browser
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   cmd = "Neotree",
  --   keys = {
  --     { '-', ':<C-u>Neotree focus filesystem right reveal_force_cwd<CR>', mode = 'n', silent = true },
  --   },
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     -- { 'miversen33/netman.nvim',
  --     --   opts = true,
  --     -- },
  --   },
  --   opts = function()
  --     require("opts/neo-tree")
  --   end,
  -- },
  {
    "stevearc/oil.nvim",
    lazy = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.keymap.set("n", "-", ":<C-u>Oil --float .<CR>", { silent = true })
    end,
    config = function()
      require("config/oil")
    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    cmd = "Oil",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = function()
      require("config/oil-git-status")
    end,
  },
  -- colorizer
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      { "andymass/vim-matchup",
        keys = { "%" },
      },
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = ":TSUpdate",
    install = function()
      require("nvim-treesitter.install").setup({
        compilers = { "clang" }
      })
    end,
    config = function()
      require("config/nvim-treesitter")
    end,
  },
  -- indentation
  {
    "Yggdroot/indentLine",
    event = "BufEnter",
    config = function()
      require("config/indentline")
    end,
  },

  -- LSP

  -- AGI
  -- repo = 'Exafunction/codeium.vim'
  -- on_event = 'BufEnter'
  -- # hook_add = 'source ~/.config/nvim/plugins/codeium-vim.rc.vim'

  -- Git
  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
    keys = {
      { '<Leader>gm', ':<C-u>GitMessenger<CR>', mode = 'n', silent = true },
    },
    config = function()
      require("config/git-messenger")
    end,
  },
  -- editing
  {
    "easymotion/vim-easymotion",
    event = "BufEnter",
    config = function()
      require("config/easymotion")
    end
  },
  {
    "machakann/vim-sandwich",
    event = "BufEnter",
    config = function()
      require("config/sandwich")
    end,
  },
  {
    "tpope/vim-repeat",
    event = "BufEnter",
    dependencies = {
      "tpope/vim-surround",
      "tpope/vim-commentary",
      { "glts/vim-radical",
        dependencies = { "glts/vim-magnum" },
      },
    },
  },
  {
    "tommcdo/vim-exchange",
    event = "BufEnter",
  },
  {
    "kana/vim-operator-replace",
    dependencies = {
      "kana/vim-operator-user",
    },
    keys = {
      { "'", '<Plug>(operator-replace)', silent = true },
    },
  },
  { "haya14busa/vim-asterisk",
    keys = {
      { '*', '<Plug>(asterisk-z*)<Plug>(is-nohl-1)' },
      { '#', '<Plug>(asterisk-z#)<Plug>(is-nohl-1)' },
      { 'g*', '<Plug>(asterisk-gz*)<Plug>(is-nohl-1)' },
      { 'g#', '<Plug>(asterisk-gz#)<Plug>(is-nohl-1)' },
    },
  },
  {
    "jiangmiao/auto-pairs",
    event = "BufEnter",
  },
  {
    "bronson/vim-trailing-whitespace",
    keys = {
      { '<Leader>T', ':<C-u>FixWhitespace<CR>', mode= 'n', silent = true },
    },
  },
}
