require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup(
    -- Install automatically in case thery're not
    -- 'java-debug-adapter', 'java-test', 'lua-language-server', 'java-debug-adapter', vim-language-server
        { ensure_installed = { 'jdtls' } }
    )

-- Setup language servers.

require('java-jdtls')
require('lua-config')
require('vim-config')

--

require('mappings')
require('nvim-treesitter.configs').setup{
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'typescript', 'help', 'java', 'vim' }
}

vim.lsp.set_log_level('debug')
