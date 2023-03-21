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
    { ensure_installed = { 'jdtls', 'lua_ls' } }
)

-- Setup language servers.

require('java-jdtls')
require('lua-config')
require('vim-config')

--

require('mappings')
require("nvim-treesitter.install").prefer_git = true
require 'nvim-treesitter.install'.compilers = { "cc" }
require 'nvim-treesitter.configs'.setup {

    sync_install = false,
    highlight = {
        enable = true,
        disable = { "c", "rust" }
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },
    indent = {
        enable = true
    },
    textobjects = { enable = true }
}


vim.lsp.set_log_level('debug')
