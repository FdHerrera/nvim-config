local cmp_capabilities = require('cmp-capabilities').getCapabilities()
require('lspconfig').vimls.setup {
	capabilities = cmp_capabilities
}
