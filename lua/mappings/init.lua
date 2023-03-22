-- Global mappings --
vim.keymap.set('n', '<space>nt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<space>nT', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<space>c', 'NvimTreeCollapse<CR>')
vim.keymap.set('n', '<space>f', ':FZF<CR>')
vim.keymap.set('n', '<space>s', ':w<Enter>')
vim.keymap.set('n', '<space>wq', ':wq<Enter>')
vim.keymap.set('n', '<space>q', ':q<Enter>')
vim.keymap.set('v', '<space>c', '"*y')
vim.keymap.set('n', '<leader>s', ':Ack ')
vim.keymap.set('n', '<space>;', 'A;<Esc>')
vim.keymap.set('n', '<C-j>', '10j')
vim.keymap.set('n', '<C-k>', '10k')
-- Finish Global Mappings --


-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
		vim.keymap.set('n', '<space>i', function() require('jdtls').organize_imports() end, opts)
		vim.keymap.set('n', '<space>xv', function() require('jdtls').extract_variable() end, opts)
		vim.keymap.set('v', '<space>xv', function() require('jdtls').extract_variable() end, opts)
		vim.keymap.set('n', '<space>xc', function() require('jdtls').extract_constant() end, opts)
		vim.keymap.set('v', '<space>xc', function() require('jdtls').extract_constant() end, opts)
		vim.keymap.set('v', '<space>xm', function() require('jdtls').extract_method() end, opts)

		-- If using nvim-dap
		-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
		vim.keymap.set('n', '<space>T', function() require('jdtls').test_class() end, opts)
		vim.keymap.set('n', '<space>t', function() require('jdtls').test_nearest_method() end, opts)
	end,
})
