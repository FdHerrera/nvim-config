local utils = require("utils")
require("lspconfig").vuels.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
