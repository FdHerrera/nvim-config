local cmp_capabilities = require("utils").getCapabilities()
local lspconfig = require("lspconfig")

lspconfig.kotlin_language_server.setup({
	capabilities = cmp_capabilities,
	root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle"),
})
