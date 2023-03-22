-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Loads Plugins Specific Config --
require('plugins.tree-sitter-config')
require('plugins.cmp-config')
require('plugins.mason-lsp')
require('plugins.nvim-tree-config')

-- Loads config for Servers --
require('plugins.servers-config')
