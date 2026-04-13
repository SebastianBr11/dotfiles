vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

require("mason-lspconfig").setup({
	ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
	automatic_enable = { exclude = { "tsgo" } }, -- automatically run vim.lsp.enable() for all servers that are installed via Mason
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		map("grr", require("snacks").picker.lsp_references, "[G]oto [R]eferences")
		map("gri", require("snacks").picker.lsp_implementations, "[G]oto [I]mplementation")
		map("grd", require("snacks").picker.lsp_definitions, "[G]oto [D]efinition")
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gO", require("snacks").picker.lsp_symbols, "Open Document Symbols")
		map("gW", require("snacks").picker.lsp_workspace_symbols, "Open Workspace Symbols")
		map("grt", require("snacks").picker.lsp_type_definitions, "[G]oto [T]ype Definition")
		map("<leader>td", function()
			vim.diagnostic.enable(not vim.diagnostic.is_enabled())
		end, "[T]oggle [D]iagnostics")

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")

			-- Enable inlay hints by default
			vim.lsp.inlay_hint.enable()
		end
	end,
})
