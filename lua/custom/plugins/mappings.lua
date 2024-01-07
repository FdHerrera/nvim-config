-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- NetRW remaps, they suck

-- Utility to remap commands using netrw (the default finder for nvim)
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "netrw mappings",
	callback = function()
		local bind = function(map, to)
			vim.keymap.set("n", map, to, { remap = true, buffer = true })
		end

		-- Add file
		bind("a", "%")
		-- Rename file under the cursor
		bind("r", "R")
		-- Enter file
		bind("o", "<cr>")
		-- Go Up
		bind("u", "-")
	end,
})
return {}
