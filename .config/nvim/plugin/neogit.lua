vim.pack.add({
  "https://github.com/esmuellert/codediff.nvim",
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/nvim-lua/plenary.nvim",
})

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Neo[G]it [S]how" })
