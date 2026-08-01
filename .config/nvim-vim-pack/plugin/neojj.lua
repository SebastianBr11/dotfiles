vim.pack.add({
  "https://github.com/esmuellert/codediff.nvim",
  "https://github.com/NicholasZolton/NeoJJ",
  "https://github.com/nvim-lua/plenary.nvim",
})

vim.keymap.set("n", "<leader>js", "<cmd>Neojj<cr>", { desc = "Neo[J]J [S]how" })
