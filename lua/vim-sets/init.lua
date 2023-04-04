vim.g.mapleader = ','

local set = vim.opt

-- Tabs
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

-- Min Up and Down
set.scrolloff = 8

-- Indent
set.smartindent = true

-- No backup
set.backup = false
set.writebackup = false

set.signcolumn = 'yes'

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
vim.cmd.colorscheme('nightfox')
set.guifont = 'Fira Code'
vim.api.nvim_set_hl(0, "Normal", { bg = 'None', ctermbg = 'None' })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'None', ctermbg = 'None' })
