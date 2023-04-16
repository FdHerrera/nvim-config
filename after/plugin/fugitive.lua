local M = {}

function M.mappings()
	vim.keymap.set("n", "<space>gs", vim.cmd.Git)
end

return M
