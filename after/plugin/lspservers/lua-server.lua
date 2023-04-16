local lspconfig = require("lspconfig")
local cmp_capabilities = require("utils").getCapabilities()
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
	capabilities = cmp_capabilities,
})
