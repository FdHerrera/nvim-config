local utils = require("utils")
require("lspconfig").yamlls.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
