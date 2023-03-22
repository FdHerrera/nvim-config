-- empty setup using defaults
require("nvim-tree").setup({
	view = { cursorline = false }
})

vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
vim.cmd [[hi NvimTreeNormalNC guibg=NONE ctermbg=NONE]]
