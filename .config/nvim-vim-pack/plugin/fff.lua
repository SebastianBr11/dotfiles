vim.pack.add({
  { src = "https://github.com/dmtrKovalenko/fff.nvim", version = Config.pack_versions.fff },
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "<leader>ff", function()
  require("fff").find_files()
end, { desc = "[F]FF [f]iles" })
vim.keymap.set("n", "<leader>fg", function()
  require("fff").live_grep()
end, { desc = "[F]FF [g]rep" })
vim.keymap.set({ "n", "x" }, "<leader>fw", function()
  require("fff").live_grep_under_cursor()
end, { desc = "[F]FF current [w]ord / selection" })
vim.keymap.set({ "n" }, "<leader>fr", "<cmd>FFFResume<CR>", { desc = "[F]FF [R]esume" })
