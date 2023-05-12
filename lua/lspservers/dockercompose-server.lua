local cmp_capabilities = require("utils").getCapabilities()
require("lspconfig").docker_compose_language_service.setup({
	capabilities = cmp_capabilities,
})
