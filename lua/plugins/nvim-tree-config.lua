-- empty setup using defaults
require("nvim-tree").setup({
	renderer = {
		group_empty = true
	}
})

vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
vim.cmd [[hi NvimTreeNormalNC guibg=NONE ctermbg=NONE]]
