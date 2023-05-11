local cmp_capabilities = require("utils").getCapabilities()
require("lspconfig").gradle_ls.setup({
        cmd = { "cmd.exe", "/C", "gradle-language-server" },
	capabilities = cmp_capabilities,
})
