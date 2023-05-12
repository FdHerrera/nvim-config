local cmp_capabilities = require("utils").getCapabilities()
require("lspconfig").dockerls.setup({
	capabilities = cmp_capabilities,
})
