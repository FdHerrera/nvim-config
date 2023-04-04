-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Loads Plugins Specific Config --
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.mason-lsp")
require("plugins.nvimtree")
require("plugins.harpoon")
require("plugins.formatter")

-- Loads config for Servers --
require("plugins.lspservers")
