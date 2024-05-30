local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and
      vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k><C-c>'] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Tab setting: https://github.com/ray-x/lsp_signature.nvim/blob/master/tests/init_paq.lua
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ----- disable keymap
    -- ['<C-e>'] = cmp.mapping.abort(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'nvim_lua' },
    { name = 'crates' },
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

-- nvim-autopairs integration
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

-- Setup neodev before lspconfig
require('neodev').setup({
  -- enable type-checking for nvim-dap-ui
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Setup lspconfig
local lspconfig = require('lspconfig')
local configs = require("lspconfig.configs")
local servers = {
  'lua_ls',
  'tsserver',
  'ruff_lsp',
  'bashls',
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navbuddy = require('nvim-navbuddy')
local on_attach = function(client, bufnr)
  navbuddy.attach(client, bufnr)
  if client.name == 'ruff_lsp' then
    -- Disable hover in favor of Other client
    client.server_capabilities.hoverProvider = false
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
