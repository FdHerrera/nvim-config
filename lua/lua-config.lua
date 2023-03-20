local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup{
    settings = {
        Lua = {
            runtime = {
                path = lspconfig.util.find_git_ancestor()
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
