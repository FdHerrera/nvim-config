local util = require("lspconfig.util")
require("lspconfig").graphql.setup({
	root_dir = util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
})
