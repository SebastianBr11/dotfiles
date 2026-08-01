vim.pack.add({
  "https://github.com/TheNoeTrevino/haunt.nvim",
})

require("haunt").setup()

local haunt = require("haunt.api")
local haunt_picker = require("haunt.picker")
local map = vim.keymap.set
local prefix = "<leader>m"

-- annotations
map("n", prefix .. "a", function()
  haunt.annotate()
end, { desc = "[M]ark [a]dd" })

map("n", prefix .. "t", function()
  haunt.toggle_annotation()
end, { desc = "[M]ark [t]oggle" })

map("n", prefix .. "T", function()
  haunt.toggle_all_lines()
end, { desc = "[M]ark [T]oggle all" })

map("n", prefix .. "d", function()
  haunt.delete()
end, { desc = "[M]ark [d]elete" })

map("n", prefix .. "C", function()
  haunt.clear_all()
end, { desc = "[M]ark [C]lear all" })

-- move
map("n", prefix .. "p", function()
  haunt.prev()
end, { desc = "[M]ark [p]revious" })

map("n", prefix .. "n", function()
  haunt.next()
end, { desc = "[M]ark [n]ext" })

-- picker
map("n", prefix .. "l", function()
  haunt_picker.show()
end, { desc = "[M]ark [l]ist in picker" })

-- quickfix
map("n", prefix .. "q", function()
  haunt.to_quickfix()
end, { desc = "[M]ark send to [q]uickfix list (buffer)" })

map("n", prefix .. "Q", function()
  haunt.to_quickfix({ current_buffer = true })
end, { desc = "[M]ark send to [Q]uickfix list (all)" })

-- yank
map("n", prefix .. "y", function()
  haunt.yank_locations({ current_buffer = true })
end, { desc = "[M]ark [y]ank (buffer)" })

map("n", prefix .. "Y", function()
  haunt.yank_locations()
end, { desc = "[M]ark [Y]ank (all)" })
