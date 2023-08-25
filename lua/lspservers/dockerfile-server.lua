local utils = require("utils")
require("lspconfig").dockerls.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
