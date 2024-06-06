local duck = require("duck")

local all_characters = {
  "🦖",
  "🐈",
  "🐎",
  "🐤",
  "🦀",
}
local size = 5
local character = function()
  return all_characters[math.random(1, size)]
end
local speed = function()
  return math.random(0.3, 20.0)
end

local opts = { silent = true, noremap = true }

opts.desc = "duck hatch"
-- vim.keymap.set("n", "<Leader>dd", function() duck.hatch(dinosaur) end, opts)
vim.keymap.set("n", "<Leader>dd", function() duck.hatch(character(), speed()) end, opts)
opts.desc = "duck cook"
vim.keymap.set("n", "<Leader>dk", function() duck.cook() end, opts)
opts.desc = "duck cook_all"
vim.keymap.set("n", "<Leader>da", function() duck.cook_all() end, opts)
