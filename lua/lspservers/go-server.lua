local utils = require"utils"
require("lspconfig").gopls.setup({
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
