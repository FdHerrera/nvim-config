require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"css",
		"javascript",
		"vue",
		"java",
		"typescript",
		"c",
		"lua",
		"vim",
		"dockerfile",
		"json",
		"yaml",
		"comment",
		"css",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"graphql",
		"go",
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
