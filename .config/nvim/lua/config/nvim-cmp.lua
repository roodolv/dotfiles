-- Set up nvim-cmp.
local cmp = require("cmp")
local ls = require("luasnip")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<F5>'] = cmp.mapping.complete(),
    ['<C-q>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- LuaSnip keymaps
    ['<C-k><C-e>'] = cmp.mapping(function(fallback)
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k><C-c>'] = cmp.mapping(function(fallback)
      if ls.choice_active() then
        ls.change_choice(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- disable keymap
    -- ['<C-e>'] = cmp.mapping.abort(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'nvim_lua' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Setup neodev before lspconfig
require('neodev').setup()

-- Setup lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local servers = {
  'rust_analyzer',
  'tsserver',
  'lua_ls',
  'biome',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
