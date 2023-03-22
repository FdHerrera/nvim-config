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
Plug 'nvim-lua/plenary.nvim'
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

" NERDTree tabs
nnoremap <space>l gt<CR>
nnoremap <space>h gT<CR>
" Switchs pane
nmap <space>w <C-w>w

" Finder
nnoremap <leader>f :FZF<Enter>

" Saves 
nnoremap <space>s :w<Enter>

" Saves and quits
nnoremap <space>e :wq<Enter>

" Quits
nnoremap <space>q :q<Enter>

" Copy to clipboard
vmap <space>c "*y

" Searchs with Ack
nnoremap <leader>s :Ack<space>

" Inserts a semicolon at the end of the line
nnoremap <space>; A;<Esc>

nnoremap <C-j> 10j
nnoremap <C-k> 10k

"Setters
syntax on
set guifont=Fira\ Code
colorscheme carbonfox
set nocursorline 
set rnu nu 
hi Normal guibg=NONE ctermbg=NONE
set showmatch
set termguicolors

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

lua require('init')

