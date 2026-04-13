vim.pack.add({
	"https://github.com/esmuellert/codediff.nvim",
	"https://github.com/NeogitOrg/neogit",
})

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Neo[G]it [S]how" })
