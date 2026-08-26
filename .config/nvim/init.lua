_G.Config = {}
Config.pack_versions = {
  fff = "v0.9.6",
}

Config.lsp_servers_table = {
  angularls = "angularls",
  astro = "astro",
  bashls = "bashls",
  biome = "biome",
  css_variables = "css_variables",
  cssls = "cssls",
  fish_lsp = "fish_lsp",
  html = "html",
  jsonls = "jsonls",
  lua_ls = "lua_ls",
  rumdl = "rumdl",
  stylua = "stylua",
  svelte = "svelte",
  tailwindcss = "tailwindcss",
  tinymist = "tinymist",
  tombi = "tombi",
  tsgo = "tsgo",
  vtsls = "vtsls",
  vue_ls = "vue_ls",
  yamlls = "yamlls",
}
Config.formatters_table = {
  oxfmt = "oxfmt",
  prettierd = "prettierd",
  shfmt = "shfmt",
}
Config.linters_table = {
  hadolint = "hadolint",
}
Config.other_mason_tools_table = {
  tree_sitter_cli = "tree-sitter-cli",
}

Config.lsp_servers = vim.tbl_values(Config.lsp_servers_table)
Config.formatters = vim.tbl_values(Config.formatters_table)
Config.linters = vim.tbl_values(Config.linters_table)
Config.other_mason_tools = vim.tbl_values(Config.other_mason_tools_table)

Config.mason_ensure_installed = Config.other_mason_tools
vim.list_extend(Config.mason_ensure_installed, Config.lsp_servers)
vim.list_extend(Config.mason_ensure_installed, Config.formatters)
vim.list_extend(Config.mason_ensure_installed, Config.linters)
