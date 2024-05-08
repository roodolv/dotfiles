return {
  -----------------------------------------------------------------
  -- theme
  -----------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  -----------------------------------------------------------------
  -- startup
  -----------------------------------------------------------------
  {
    "mhinz/vim-startify",
    lazy = false,
    config = function()
      require("config/startify")
    end
  },
  -----------------------------------------------------------------
  -- pane/tab/window
  -----------------------------------------------------------------
  {
    "simeji/winresizer",
    keys = {
      { "<Leader>R", ":<C-u>WinResizerStartResize<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/winresizer")
    end,
  },
  {
    "preservim/tagbar",
    keys = {
      { "<Leader>gt", ":<C-u>TagbarToggle<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/tagbar")
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<Leader>gu", ":<C-u>UndotreeToggle<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/undotree")
    end,
  },
  -----------------------------------------------------------------
  -- search/navigation
  -----------------------------------------------------------------
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
  -- TODO: Add telescope.nvim, flash.nvim here
  -----------------------------------------------------------------
  -- filer/browser
  -----------------------------------------------------------------
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- {
      --   "refractalize/oil-git-status.nvim",
      --   config = function()
      --     require("oil").setup({
      --       win_options = { signcolumn = "yes:2", }
      --     })
      --     require("config/oil-git-status")
      --   end,
      -- },
      -- {
      --   "SirZenith/oil-vcs-status",
      --   config = function()
      --     require("oil").setup({
      --       win_options = { signcolumn = "number", }
      --     })
      --     require("config/oil-vcs-status")
      --   end,
      -- },
    },
    init = function()
      vim.keymap.set("n", "-", ":<C-u>Oil --float .<CR>", { silent = true })
    end,
    config = function()
      require("config/oil")
    end,
  },
  -----------------------------------------------------------------
  -- syntax/indentation
  -----------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "andymass/vim-matchup",
        keys = { "%" },
      },
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
  {
    "Yggdroot/indentLine",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config/indentline")
    end,
  },
  -----------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("config/mason-lspconfig")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function ()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }
          -- TODO: fix here
          vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<M-s>', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-j>i', vim.lsp.buf.implementation, opts)
          vim.keymap.set({'n', 'i'}, '<C-p>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set({'n', 'i'}, '<S-M-r>', vim.lsp.buf.rename, opts)
          vim.keymap.set({'n', 'i'}, '<M-CR>', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<C-j>h', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<M-j>', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '<M-k>', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  -- {
  --   "VonHeikemen/lsp-zero.nvim",
  --   branch = "v2.x",
  --   lazy = true,
  --   config = function()
  --     -- This is where you modify the settings for lsp-zero
  --     -- Note: autocompletion settings will not take effect
  --     require("lsp-zero.settings").preset({
  --       name = "minimal",
  --       set_lsp_keymaps = false,
  --       manage_nvim_cmp = true,
  --       suggest_lsp_servers = true,
  --     })
  --   end
  -- },
  -----------------------------------------------------------------
  -- snippets/completion
  -----------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- For LuaSnip
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- For Neovim Lua API
      "folke/neodev.nvim",
    },
    config = function()
      require("config/nvim-cmp")
    end
  },
  { "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
      -- LuaSnip official settings
      local ls = require("luasnip")
      -- TODO: fix & understand these
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
    end
  },

  -- repo = "Exafunction/codeium.vim"
  -- on_event = "BufEnter"
  -- # hook_add = "source ~/.config/nvim/plugins/codeium-vim.rc.vim"
  -----------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------
  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
    keys = {
      { "<Leader>gm", ":<C-u>GitMessenger<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/git-messenger")
    end,
  },
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)")
      vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)")
    end,
  },
  -----------------------------------------------------------------
  -- editing
  -----------------------------------------------------------------
  {
    "easymotion/vim-easymotion",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config/easymotion")
    end
  },
  {
    "machakann/vim-sandwich",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config/sandwich")
    end,
  },
  {
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
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
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "kana/vim-operator-replace",
    dependencies = {
      "kana/vim-operator-user",
    },
    keys = {
      { "'", "<Plug>(operator-replace)", silent = true },
    },
  },
  { "haya14busa/vim-asterisk",
    keys = {
      { "*", "<Plug>(asterisk-z*)<Plug>(is-nohl-1)" },
      { "#", "<Plug>(asterisk-z#)<Plug>(is-nohl-1)" },
      { "g*", "<Plug>(asterisk-gz*)<Plug>(is-nohl-1)" },
      { "g#", "<Plug>(asterisk-gz#)<Plug>(is-nohl-1)" },
    },
  },
  {
    "jiangmiao/auto-pairs",
    -- event = { "BufReadPre", "BufNewFile", "BufEnter" },
  },
  {
    "bronson/vim-trailing-whitespace",
    keys = {
      { "<Leader>T", ":<C-u>FixWhitespace<CR>", mode= "n", silent = true },
    },
  },
}
