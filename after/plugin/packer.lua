vim.cmd([[packadd packer.nvim]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "alvan/vim-closetag" })
	use({ "prettier/vim-prettier", run = "npm install" })
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "HiPhish/nvim-ts-rainbow2" })
	use({ "toppair/peek.nvim", run = "deno tast --quiet build:fast" })
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "mhartington/formatter.nvim" })
	use({ "airblade/vim-gitgutter" })
	use({ "tpope/vim-fugitive" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "mfussenegger/nvim-jdtls" })
	use({ "udalov/kotlin-vim" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "numToStr/Comment.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "folke/neodev.nvim" })
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "vim-test/vim-test" })
	use({
		"microsoft/vscode-js-debug",
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist ou",
	})
	use({ "mxsdev/nvim-dap-vscode-js" })
	use({ "ThePrimeagen/harpoon" })
	use({ "nvim-telescope/telescope.nvim", { tag = "0.1.1" } })
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
