require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.install").compilers = { "cc" }
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"help",
		"html",
		"css",
		"javascript",
		"vue",
		"java",
		"typescript",
		"c",
		"lua",
		"vim",
	},
	sync_install = false,
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = { enable = true },
	additional_vim_regex_highlighting = false,
})
