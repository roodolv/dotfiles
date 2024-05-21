local illuminate = require("illuminate")

illuminate.configure({
  filetypes_denylist = {
    "dirbuf",
    "dirvish",
    "fugitive",
    "oil",
    "sagafinder",
    "sagacallhierarchy",
    "sagaincomingcalls",
    "sagapeekdefinition",
    "TelescopePrompt",
  },
})
