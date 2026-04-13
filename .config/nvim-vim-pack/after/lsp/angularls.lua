---@type vim.lsp.Config
return {
	workspace_required = true,
	on_attach = function(angular_client)
		-- Taken from https://github.com/bohdancho/neovimrc/blob/5a09703e94c16f3bba589cf1b5f36eaf11cb6dd4/init.lua#L576
		-- both vtsls and angularls have renameProvider so disable it for vtsls
		local vtsls_client = vim.lsp.get_clients({ name = "vtsls" })[1]
		if vtsls_client ~= nil then
			angular_client.server_capabilities.renameProvider = false
			angular_client.server_capabilities.foldingRangeProvider = false
			vtsls_client.server_capabilities.referencesProvider = false
			return
		end

		local tsgo_client = vim.lsp.get_clients({ name = "tsgo" })[1]
		if tsgo_client ~= nil then
			angular_client.server_capabilities.renameProvider = false
			angular_client.server_capabilities.foldingRangeProvider = false
			angular_client.server_capabilities.referencesProvider = false
		end
	end,
}
