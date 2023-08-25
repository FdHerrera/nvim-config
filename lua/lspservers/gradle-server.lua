local utils = require("utils")
require("lspconfig").gradle_ls.setup({
        cmd = { "cmd.exe", "/C", "gradle-language-server" },
	on_attach = utils.on_attach,
	capabilities = utils.capabilities,
})
