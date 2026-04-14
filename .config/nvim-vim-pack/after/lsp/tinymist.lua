---@type vim.lsp.Config
return {
	---@type lspconfig.settings.tinymist
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "enable",
		formatterProseWrap = true,
		formatterPrintWidth = 80,
		lint = {
			enabled = true,
			when = "onType",
		},
	},
}
