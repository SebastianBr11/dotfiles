vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })

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
				lsp_format = "fallback",
			}
		end
	end,
	formatters = {
		-- Only run biome if the project has its config files
		["biome-check"] = {
			require_cwd = true,
		},
	},
	formatters_by_ft = {
		-- Webdev
		astro = { "biome-check", "prettierd", stop_after_first = true },
		css = { "biome-check", "prettierd", stop_after_first = true },
		scss = { "biome-check", "prettierd", stop_after_first = true },
		graphql = { "biome-check", "prettierd", stop_after_first = true },
		html = { "biome-check", "prettierd", stop_after_first = true },
		htmlangular = { "biome-check", "prettierd", stop_after_first = true },
		javascript = { "biome-check", "prettierd", stop_after_first = true },
		javascriptreact = { "biome-check", "prettierd", stop_after_first = true },
		svelte = { "biome-check", "prettierd", stop_after_first = true },
		typescript = { "biome-check", "prettierd", stop_after_first = true },
		["typescript.tsx"] = { "biome-check", "prettierd", stop_after_first = true },
		typescriptreact = { "biome-check", "prettierd", stop_after_first = true },
		vue = { "biome-check", "prettierd", stop_after_first = true },

		-- Other
		json = { "biome-check", "prettierd", stop_after_first = true },
		jsonc = { "biome-check", "prettierd", stop_after_first = true },
		lua = { "stylua" },
		sh = { "shfmt" },
	},
})
