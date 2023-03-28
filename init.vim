call plug#begin()
Plug 'EdenEast/nightfox.nvim' "Theme
Plug 'maximbaz/lightline-ale' "Status Bar Theme
Plug 'itchyny/lightline.vim' "Status Bar
Plug 'jiangmiao/auto-pairs' "Pairing
Plug 'alvan/vim-closetag' "Tags closer
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "Prettier
Plug 'junegunn/fzf' "File Finder
Plug 'junegunn/fzf.vim' "File Finder
Plug 'yggdroot/indentline' "Highligth indentation
Plug 'nvim-treesitter/nvim-treesitter' "Tree-Sitter
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'ThePrimeagen/harpoon'
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'
call plug#end()

let mapleader = ","

" Extended lines beyond display (scroll needed)
set nowrap

" No highlight in Search
set nohlsearch

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"Setters
syntax on
set guifont=Fira\ Code
colorscheme terafox
set nocursorline 
set rnu nu 
hi Normal guibg=NONE ctermbg=NONE
set showmatch
set termguicolors

lua require('init')

