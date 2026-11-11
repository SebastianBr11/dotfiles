---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.ltex
  settings = {
    ltex = {
      language = "en-US",
      enabled = {
        "bib",
        "gitcommit",
        "html",
        "markdown",
        "org",
        "mdx",
        "tex",
        "latex",
        "text",
        "typst",
      },
    },
  },
}
