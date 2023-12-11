return {
	-- Theme inspired by Atom
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	opts = {
		transparent_background = false,
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
			ts_rainbow2 = true,
			neotest = true,
			which_key = true,
			indent_blankline = {
				enabled = true,
				scope_color = "lavender",
				colored_indent_levels = true,
			},
		},
	}
}
