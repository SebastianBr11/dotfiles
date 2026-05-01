_G.Config = {}
Config.lsp_servers_table = {
	angularls = "angularls",
	astro = "astro",
	biome = "biome",
	css_variables = "css_variables",
	cssls = "cssls",
	html = "html",
	jsonls = "jsonls",
	lua_ls = "lua_ls",
	rumdl = "rumdl",
	stylua = "stylua",
	svelte = "svelte",
	tailwindcss = "tailwindcss",
	tombi = "tombi",
	tinymist = "tinymist",
	vtsls = "vtsls",
	vue_ls = "vue_ls",
}
Config.formatters_table = {
	prettierd = "prettierd",
	shfmt = "shfmt",
}
Config.linters_table = {
	hadolint = "hadolint",
}

Config.lsp_servers = vim.tbl_keys(Config.lsp_servers_table)
Config.formatters = vim.tbl_keys(Config.formatters_table)
Config.linters = vim.tbl_keys(Config.linters_table)

Config.mason_ensure_installed = {}
vim.list_extend(Config.mason_ensure_installed, Config.lsp_servers)
vim.list_extend(Config.mason_ensure_installed, Config.formatters)
vim.list_extend(Config.mason_ensure_installed, Config.linters)
