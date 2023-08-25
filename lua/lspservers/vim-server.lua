local utils = require("utils")
require("lspconfig").vimls.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
