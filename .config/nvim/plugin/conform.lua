vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })

local webdev_formatters = { "biome-check", "oxfmt", "prettierd", stop_after_first = true }

require("conform").setup({
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 1500,
      }
    end
  end,
  formatters = {
    -- Only run biome if the project has its config files
    ["biome-check"] = {
      require_cwd = true,
    },
    oxfmt = {
      require_cwd = true,
    },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    -- Webdev
    astro = webdev_formatters,
    css = webdev_formatters,
    scss = webdev_formatters,
    graphql = webdev_formatters,
    html = webdev_formatters,
    htmlangular = webdev_formatters,
    javascript = webdev_formatters,
    javascriptreact = webdev_formatters,
    svelte = webdev_formatters,
    typescript = webdev_formatters,
    ["typescript.tsx"] = webdev_formatters,
    typescriptreact = webdev_formatters,
    vue = webdev_formatters,

    -- Other
    json = webdev_formatters,
    jsonc = webdev_formatters,
    sh = { "shfmt" },
  },
})
