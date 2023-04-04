vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("vim-sets")
require("plugins")
require("mappings")

local function open_tree()
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_tree })
