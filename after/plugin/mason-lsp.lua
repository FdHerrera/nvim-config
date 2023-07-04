require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup(
	-- Install automatically in case thery're not
	-- 'java-debug-adapter', 'java-test', 'lua-language-server', 'java-debug-adapter', vim-language-server
	{
		ensure_installed = {
			"jdtls",
			"lua_ls",
			"vimls",
			"volar",
			"tsserver",
			"yamlls",
			"graphql",
			"kotlin_language_server",
			"gradle_ls",
			"docker_compose_language_service",
			"dockerls",
			"gradle_ls",
			"gopls",
		},
		autostart = true,
	}
)
