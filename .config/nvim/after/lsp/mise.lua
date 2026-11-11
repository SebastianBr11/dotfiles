---@type vim.lsp.Config
return {
  -- Disable capabilities that tombi also provides
  init_options = { formatting = false, hover = false, completion = false },
}
