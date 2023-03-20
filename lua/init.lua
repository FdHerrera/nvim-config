require("mason").setup({
    log_level = vim.log.levels.DEBUG,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup()

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.jdtls.setup{ cmd = { 'jdtls' } }
