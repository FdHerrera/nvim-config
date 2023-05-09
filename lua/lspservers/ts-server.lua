local cmp_capabilities = require("utils").getCapabilities()
require("lspconfig").tsserver.setup({
	capabilities = cmp_capabilities,
})
