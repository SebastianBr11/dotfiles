---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.vue_ls
  settings = {
    vue = {
      -- INFO: These settings can be enabled again, when https://github.com/neovim/neovim/issues/36318 is fixed

      -- inlayHints = {
      --   destructuredProps = true,
      --   missingProps = true,
      --   inlineHandlerLeading = true,
      --   optionsWrapper = true,
      --   vBindShorthand = true,
      -- },
    },
  },
}
