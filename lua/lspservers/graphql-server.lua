local util = require("lspconfig.util")
local utils = require("utils")
require("lspconfig").graphql.setup({
	root_dir = util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
