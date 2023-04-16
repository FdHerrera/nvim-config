local cmp_capabilities = require("utils").getCapabilities()
require("lspconfig").vimls.setup({
	capabilities = cmp_capabilities,
})
