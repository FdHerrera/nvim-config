-- Utility to remap commands using netrw (the default finder for nvim)
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "netrw mappings",
	callback = function()
		local bind = function(map, to)
			vim.keymap.set("n", map, to, { remap = true, buffer = true })
		end

		--------------
		-- Mappings --
		--------------

		-- Add file
		bind("a", "%")
		-- Rename file under the cursor
		bind("r", "R")
		-- Enter file
		bind("o", "<cr>")

		--------------
		-- Mappings --
		--------------

	end,
})
