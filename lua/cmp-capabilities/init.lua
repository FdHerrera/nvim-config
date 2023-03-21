local M = {}
-- Add additional capabilities supported by nvim-cmp
function M.getCapabilities()
	return require("cmp_nvim_lsp").default_capabilities()
end

return M
