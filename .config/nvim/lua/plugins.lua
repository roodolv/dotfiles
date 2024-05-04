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
  -----------------------------------------------------------------
  -- filer/browser
  -----------------------------------------------------------------
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "refractalize/oil-git-status.nvim",
        lazy = true,
        config = function()
          require("oil").setup({
            win_options = { signcolumn = "yes:2", }
          })
          require("config/oil-git-status")
        end,
      },
      -- {
      --   "SirZenith/oil-vcs-status",
      --   lazy = true,
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
    event = "BufEnter",
    config = function()
      require("config/indentline")
    end,
  },
  -----------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------
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
  -- completion
  -----------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      -- require("lsp-zero.cmp").extend({
      --   use_luasnip = true,
      --   set_format = true,
      --   set_sources = "recommended"
      -- })
      local cmp = require("cmp")
      -- local cmp_action = require("lsp-zero.cmp").action()
      -- cmp.setup({
      --   -- formatting = {
      --   --   format = function(entry, item)
      --   --     require("lspkind").cmp_format({
      --   --       mode = "symbol",
      --   --       symbol_map = { Copilot = "" },
      --   --     })(entry, item)
      --   --     return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      --   --   end,
      --   -- },
      --   sources = {
      --     -- { name = "copilot" },
      --     { name = "orgmode" },
      --     { name = "path" },
      --     { name = "nvim_lsp" },
      --     { name = "luasnip" },
      --     { name = "nvim_lua" },
      --     { name = "buffer" },
      --   },
      --   mapping = {
      --     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --     ["<C-o>"] = cmp.mapping.complete(),
      --     ["<C-e>"] = cmp.mapping.close(),
      --     ["<CR>"] = cmp.mapping.confirm({ select = true }),
      --     -- ["<Tab>"] = cmp_action.luasnip_supertab(),
      --     -- ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      --     -- ["<C-Space>"] = cmp.mapping.complete(),
      --     -- ["<C-y>"] = cmp_action.luasnip_jump_forward(),
      --     -- ["<C-n>"] = cmp_action.luasnip_jump_backward(),
      --   }
      -- })
    end
  },
  -- {
  --   "folke/neodev.nvim",
  --   ft = "lua",
  --   config = true,
  -- },
  -----------------------------------------------------------------
  -- AGI
  -----------------------------------------------------------------
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
    event = "BufEnter",
    config = function()
      if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        vim.g.gitgutter_git_executable = "C:/Program Files/Git/bin/git.exe"
      end
      vim.keymap.set("n", "[h", "<Plug>(GitGutterNextHunk)")
      vim.keymap.set("n", "]h", "<Plug>(GitGutterPrevHunk)")
    end,
  },
  -----------------------------------------------------------------
  -- editing
  -----------------------------------------------------------------
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
    event = "BufEnter",
  },
  {
    "bronson/vim-trailing-whitespace",
    keys = {
      { "<Leader>T", ":<C-u>FixWhitespace<CR>", mode= "n", silent = true },
    },
  },
}
