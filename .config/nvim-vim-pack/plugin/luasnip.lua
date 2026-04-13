vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
})

require("luasnip").filetype_extend("typescript", { "angular" })
require("luasnip").filetype_extend("html", { "angular" })
require("luasnip.loaders.from_vscode").lazy_load()
