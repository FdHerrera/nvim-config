require('harpoon').setup()

local mark = require('harpoon.mark')
local harpoon = require('harpoon.ui')

vim.keymap.set('n', '<C-a>', function () mark.add_file() end)
vim.keymap.set('n', '<C-m>', function () harpoon.toggle_quick_menu() end)
vim.keymap.set('n', '<F1>', function () harpoon.nav_file(1) end)
vim.keymap.set('n', '<F2>', function () harpoon.nav_file(2) end)
vim.keymap.set('n', '<F3>', function () harpoon.nav_file(3) end)
vim.keymap.set('n', '<F4>', function () harpoon.nav_file(4) end)
