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
	integrations = {
		cmp = true,
		harpoon = true,
		mason = true,
		telescope = true,
		dap = {
			enabled = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-macchiato")
