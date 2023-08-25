local utils = require("utils")
local lspconfig = require("lspconfig")

lspconfig.kotlin_language_server.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
	root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle"),
})
