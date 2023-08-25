vim.g.mapleader = ","

local set = vim.opt

-- Min Up and Down
set.scrolloff = 8

-- No backup
set.backup = false
set.writebackup = false

set.signcolumn = "yes"

-- Current lumber line and relative up and down
set.nu = true
set.relativenumber = true

-- Show match search do not highlight previous searchs
set.showmatch = true
set.hlsearch = false

-- Writes beyond margin
set.wrap = false

-- Updates more frequently
set.updatetime = 50

vim.o.termguicolors = true
set.guifont = "Fira Code"

-- Clears banner
vim.g.netrw_banner = 0
