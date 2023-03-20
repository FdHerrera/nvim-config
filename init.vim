call plug#begin()
Plug 'haishanh/night-owl.vim'

"Syntax
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'

"Status Bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Typing 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/yaegassy/coc-volar'
Plug 'mileszs/ack.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'wbthomason/packer.nvim',
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'
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

" Trees
nnoremap <leader>nt :NERDTree<Enter>
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
colorscheme tokyonight
set rnu nu 
set cursorline
set showmatch

lua require('init')

