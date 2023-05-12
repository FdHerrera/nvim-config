local cmp_capabilities = require("utils").getCapabilities()
require("lspconfig").yamlls.setup({
	capabilities = cmp_capabilities,
})
