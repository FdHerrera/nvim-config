call plug#begin()
" Style
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } "Theme
Plug 'nvim-lualine/lualine.nvim' "Status bar
Plug 'lukas-reineke/indent-blankline.nvim' "Indents
Plug 'windwp/nvim-autopairs' "Pairing
Plug 'alvan/vim-closetag' "Tags closer
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "Prettier
Plug 'nvim-treesitter/nvim-treesitter' "Tree-Sitter
Plug 'nvim-tree/nvim-web-devicons' "Icons
Plug 'HiPhish/nvim-ts-rainbow2'
" Style

" Servers and Git
Plug 'airblade/vim-gitgutter' "Git changes
Plug 'tpope/vim-fugitive' "Git Integration
Plug 'williamboman/mason.nvim' "Servers Admin
Plug 'williamboman/mason-lspconfig.nvim' "Lsp Config
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls' "Java Server LSP
Plug 'udalov/kotlin-vim' "Kotlin
" Servers and Git

" Autocompletion 
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-buffer' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-path' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lua' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' "Snippets
Plug 'nvim-lua/plenary.nvim' "Base
Plug 'numToStr/Comment.nvim' "Comment
" Autocompletion

" Debugging
Plug 'mfussenegger/nvim-dap' "Debug
Plug 'vim-test/vim-test' "Tests Runner
Plug 'mhartington/formatter.nvim' "Formatter
Plug 'jose-elias-alvarez/null-ls.nvim' "Code Snippets
" Debugging

"Navigation
Plug 'ThePrimeagen/harpoon' "Navigation
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
"Navigation
call plug#end()
lua require('init')

