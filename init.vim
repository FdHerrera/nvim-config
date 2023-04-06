call plug#begin()
Plug 'oxfist/night-owl.nvim' "Theme
Plug 'nvim-lualine/lualine.nvim' "Status bar
Plug 'lukas-reineke/indent-blankline.nvim' "Indents
Plug 'jiangmiao/auto-pairs' "Pairing
Plug 'alvan/vim-closetag' "Tags closer
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "Prettier
Plug 'nvim-treesitter/nvim-treesitter' "Tree-Sitter
Plug 'nvim-tree/nvim-web-devicons' "Icons
Plug 'https://github.com/airblade/vim-gitgutter' "Git changes
Plug 'mileszs/ack.vim' "File Content Searcher
Plug 'williamboman/mason.nvim' "Servers Admin
Plug 'williamboman/mason-lspconfig.nvim' "Lsp Config
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls' "Java Server LSP
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' "Snippets
Plug 'mfussenegger/nvim-dap' "Debug
Plug 'vim-test/vim-test' "Tests Runner
Plug 'mhartington/formatter.nvim' "Formatter
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon' "Navigation
Plug 'jose-elias-alvarez/null-ls.nvim' "Code Snippets
Plug 'udalov/kotlin-vim' "Kotlin
Plug 'tpope/vim-fugitive' "Git Integration
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
call plug#end()
lua require('init')

