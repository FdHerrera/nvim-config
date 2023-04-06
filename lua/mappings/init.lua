local mark = require("harpoon.mark")
local harpoon = require("harpoon.ui")

-- Global mappings --
vim.keymap.set("n", "<space>e", vim.cmd.Ex)
vim.keymap.set("n", "<space>f", ":FZF<CR>")
vim.keymap.set("n", "<space>s", ":w<Enter>")
vim.keymap.set("n", "<space>wq", ":wq<Enter>")
vim.keymap.set("n", "<space>q", ":q<Enter>")
vim.keymap.set("v", "<space>c", '"*y')
vim.keymap.set("n", "<leader>s", ":Ack ")
vim.keymap.set("n", "<space>;", "A;<Esc>")
vim.keymap.set("n", "<C-j>", "10j")
vim.keymap.set("n", "<C-k>", "10k")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<space>a", mark.add_file)
vim.keymap.set("n", "<space>hm", harpoon.toggle_quick_menu)
vim.keymap.set("n", "<space>1", function()
	harpoon.nav_file(1)
end)
vim.keymap.set("n", "<space>2", function()
	harpoon.nav_file(2)
end)
vim.keymap.set("n", "<space>3", function()
	harpoon.nav_file(3)
end)
vim.keymap.set("n", "<space>4", function()
	harpoon.nav_file(4)
end)
-- Finish Global Mappings --

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>k", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<space>F", ":Format<CR>", opts)
		vim.keymap.set("v", "<space>F", ":Format<CR>", opts)

		MapJavaKeys(opts)

		-- Debugging mappings --
		vim.keymap.set("n", "<space>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<C-n>", function()
			require("dap").continue()
		end)
		vim.keymap.set("n", "<C-i>", function()
			require("dap").step_into()
		end)
		vim.keymap.set("n", "<C-e>", function()
			require("dap").repl_open()
		end)
	end,
})

-- Maps some keys in case the buffer is a java file
function MapJavaKeys(opts)
	local buffer_file_name = vim.api.nvim_buf_get_name(0)
	local java_file = ".java"
	if buffer_file_name == nil then
		return
	end
	if buffer_file_name:sub(-string.len(java_file)) == java_file then
		vim.keymap.set("n", "<space>i", function()
			require("jdtls").organize_imports()
		end, opts)
		vim.keymap.set("n", "<space>xv", function()
			require("jdtls").extract_variable()
		end, opts)
		vim.keymap.set("v", "<space>xv", function()
			require("jdtls").extract_variable()
		end, opts)
		vim.keymap.set("n", "<space>xc", function()
			require("jdtls").extract_constant()
		end, opts)
		vim.keymap.set("v", "<space>xc", function()
			require("jdtls").extract_constant()
		end, opts)
		vim.keymap.set("v", "<space>xm", function()
			require("jdtls").extract_method()
		end, opts)

		-- If using nvim-dap
		-- This requires java-debug and vscode-java-test bundles
		vim.keymap.set("n", "<space>T", function()
			require("jdtls").test_class()
		end, opts)
		vim.keymap.set("n", "<space>t", function()
			require("jdtls").test_nearest_method()
		end, opts)
	end
end

-- Fugitive Mappings
require("plugins.fugitive").mappings()

-- Netrw mappings
require("mappings.netrw")
