vim.pack.add({
	"https://github.com/stevearc/overseer.nvim",
})

vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "[O]verseer [T]oggle" })
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "[O]verseer [R]un" })

require("overseer").setup({
	task_list = { direction = "right" },
})
