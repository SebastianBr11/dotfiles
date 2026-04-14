---@type vim.lsp.Config
return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	on_attach = function(client, bufnr)
		if vim.bo[bufnr].filetype == "vue" then
			client.server_capabilities.semanticTokensProvider.full = false
		end

		vim.api.nvim_create_user_command("TypescriptLog", function()
			client:exec_cmd({ command = "typescript.openTsServerLog", title = "Open TS Server Log" })
		end, {})
	end,
	---@type lspconfig.settings.vtsls
	settings = {
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = false },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
		vtsls = {
			autoUseWorkspaceTsdk = true,
			enableMoveToFileCodeAction = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
				maxInlayHintLength = 30,
			},
			tsserver = {
				globalPlugins = {
					{
						name = "@angular/language-server",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/angular-language-server/node_modules/@angular/language-server",
						-- Don't use typescript workspace version as recommended by Angular
						-- See https://github.com/angular/vscode-ng-language-service?tab=readme-ov-file#versioning
						enableForWorkspaceTypeScriptVersions = false,
					},
					{
						name = "@astrojs/ts-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/astro-language-server/node_modules/@astrojs/ts-plugin",
						enableForWorkspaceTypeScriptVersions = true,
					},
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
						enableForWorkspaceTypeScriptVersions = true,
					},
					{
						name = "typescript-svelte-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
						enableForWorkspaceTypeScriptVersions = true,
					},
				},
			},
		},
	},
}
