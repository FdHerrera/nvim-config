local utils = require("utils")
require("lspconfig").jsonls.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
