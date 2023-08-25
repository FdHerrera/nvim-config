local lspconfig = require("lspconfig")
local utils = require("utils")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				path = lspconfig.util.find_git_ancestor(),
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
