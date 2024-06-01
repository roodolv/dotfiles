local pain = require("no-neck-pain")

pain.setup({
  disableOnLastBuffer = true,
  autocmds = {
    enableOnVimEnter = false,
    enableOnTabEnter = false,
    reloadOnColorSchemeChange = false,
    skipEnteringNoNeckPainBuffer = true,
  },
  mappings = {
    enabled = true,
  },
  integrations = {
    neotest = {
      position = "right",
      reopen = true,
    },
    undotree = {
      position = "left", -- "left" | "right"
    },
    NvimDAPUI = {
      position = "none",
      reopen = true,
    },
  },
})
