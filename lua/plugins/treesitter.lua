require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.install").compilers = { "cc" }
require("nvim-treesitter.configs").setup({

	sync_install = false,
	highlight = {
		enable = true,
		disable = { "c", "rust" },
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
})
