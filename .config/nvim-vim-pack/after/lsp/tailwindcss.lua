---@type vim.lsp.Config
return {
	---@type lspconfig.settings.tailwindcss
	settings = {
		tailwindCSS = {
			classFunctions = { "useResolveClassNames" },
			classAttributes = {
				"class",
				"className",
				"headerClassName",
				"contentContainerClassName",
				"columnWrapperClassName",
				"endFillColorClassName",
				"imageClassName",
				"tintColorClassName",
				"ios_backgroundColorClassName",
				"thumbColorClassName",
				"trackColorOnClassName",
				"trackColorOffClassName",
				"selectionColorClassName",
				"cursorColorClassName",
				"underlineColorAndroidClassName",
				"placeholderTextColorClassName",
				"selectionHandleColorClassName",
				"colorsClassName",
				"progressBackgroundColorClassName",
				"titleColorClassName",
				"underlayColorClassName",
				"colorClassName",
				"drawerBackgroundColorClassName",
				"statusBarBackgroundColorClassName",
				"backdropColorClassName",
				"backgroundColorClassName",
				"ListFooterComponentClassName",
				"ListHeaderComponentClassName",
			},
		},
	},
}
