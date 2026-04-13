vim.pack.add({
	"https://github.com/chrisgrieser/nvim-origami",
})

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

require("origami").setup({
	autoFold = {
		enabled = true,
		kinds = { "imports" }, ---@type lsp.FoldingRangeKind[]
	},
})
