local cmp_capabilities = require('plugins.utils').getCapabilities()
require('lspconfig').vimls.setup {
	capabilities = cmp_capabilities
}
