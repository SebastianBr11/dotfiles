---@param pluginName string
---@return string
local function location(pluginName)
	return "$HOME/.local/share/nvim-vim-pack/site/pack/core/opt/" .. pluginName
end

---@type vim.lsp.Config
return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					"${3rd}/luv/library",
					location("snacks.nvim"),
					location("nvim-lspconfig"),
					-- '${3rd}/busted/library',
				},
			},
		})
	end,
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}
