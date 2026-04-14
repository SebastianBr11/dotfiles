vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	"https://github.com/xzbdmw/colorful-menu.nvim",
})

require("colorful-menu").setup()

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		["<C-f>"] = { "select_and_accept", "fallback" },
		["<Tab>"] = false,
		["<S-Tab>"] = false,
	},
	appearance = {
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = { window = { border = "rounded" } },
		menu = {
			draw = {
				-- We don't need label_description now because label and label_description are already
				-- combined together in label by colorful-menu.nvim.
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = false },
})
