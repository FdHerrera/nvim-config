local utils = require("utils")
require("lspconfig").docker_compose_language_service.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities
})
