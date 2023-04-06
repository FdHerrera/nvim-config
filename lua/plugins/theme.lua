require("catppuccin").setup({
	transparent_background = true,
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
