local wk = require("which-key")

local harpoon = require("harpoon")
local telescope = require("telescope.builtin")
local dap = require('dap')

return {
	'folke/which-key.nvim',
	config = function()
		-- Silent keymaps
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end)
		end
		-- Hides above mappings
		wk.add({
			{ "<leader>1", hidden = true },
			{ "<leader>2", hidden = true },
			{ "<leader>3", hidden = true },
			{ "<leader>4", hidden = true },
			{ "<leader>5", hidden = true },
			{ "<leader>6", hidden = true },
			{ "<leader>7", hidden = true },
			{ "<leader>8", hidden = true },
			{ "<leader>9", hidden = true },
		})
		vim.keymap.set("n", "n", "nzzzv")
		vim.keymap.set("n", "N", "Nzzzv")
		wk.add({
			{ "<leader>s",  "<cmd>w<CR>", desc = "Saves file" },
			{ "<leader>wq", ":wq<Enter>", desc = "Saves and quits" },
			{ "<leader>e",  vim.cmd.Ex,   desc = "Explorer" },
			{
				{ "<leader>f",  group = "Telescope" },
				{ "<leader>ff", telescope.find_files,  desc = "Search Files" },
				{ "<leader>fg", telescope.git_files,   desc = "Find in Git" },
				{ "<leader>fd", telescope.diagnostics, desc = "Diagnostics" },
				{ "<leader>fs", telescope.live_grep,   desc = "Search in files content" },
				{ "<leader>fb", telescope.buffers,     desc = "Search buffers" },
				{ "<leader>fh", telescope.help_tags,   desc = "Search in tags" },
				{
					"<leader>f/",
					function()
						telescope.current_buffer_fuzzy_find(
							require("telescope.themes").get_dropdown {}
						)
					end,
					desc = "Fuzzy search in current buffer"
				},
			},
			{
				{ "<leader>g",  group = "Git" },
				{ "<leader>gs", vim.cmd.Git,      desc = "Git status" },
				{ "<leader>gp", ":Git push<CR>",  desc = "Push" },
				{ "<leader>gu", ":Git pull<CR>",  desc = "Pull" },
				{ "<leader>ga", ":Git add %<CR>", desc = "Add all" },
			},
			{ "<leader>vs", ":vert sb<CR>",     desc = "Vertical split" },
			{ "<leader>q",  ":q<CR>",           desc = "Quit" },
			{ "<leader>;",  "A;<ESC>",          desc = "Append ';' to end of line" },
			{ "<leader>F",  vim.lsp.buf.format, desc = "Format file" },
			{
				{ "<leader>h",  group = "Harpoon" },
				{ "<leader>ha", function() harpoon:list():append() end,                      desc = "Add File" },
				{ "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },
			},
			{ "<leader>k",  vim.diagnostic.open_float, desc = "Open diagnostic" },
			{ "<leader>[d", vim.diagnostic.goto_prev,  desc = "Prev diagnostic" },
			{ "<leader>'d", vim.diagnostic.goto_next,  desc = "Next diagnostic" },
		})
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('key-bindings', { clear = true }),
			callback = function(args)
				local client_id = args.data.client_id
				local client = vim.lsp.get_client_by_id(client_id)
				if client.name == "jdtls" then
					wk.add({
						{
							mode = { "n" },
							{ "<leader>i", function() require("jdtls").organize_imports() end, desc = "Organize imports" },
							{
								{ "<leader>x",  group = "Extract" },
								{ "<leader>xv", function() require("jdtls").extract_variable() end, desc = "Extract variable" },
								{ "<leader>xc", function() require("jdtls").extract_constant() end, desc = "Extract constant" },
							},
						},
						{
							mode = { "v" },
							{ "<leader>i", function() require("jdtls").organize_imports() end, desc = "Organize imports" },
							{
								{ "<leader>x",  group = "Extract" },
								{ "<leader>xv", function() require("jdtls").extract_variable() end, desc = "Extract variable" },
								{ "<leader>xc", function() require("jdtls").extract_constant() end, desc = "Extract constant" },
								{ "<leader>xm", function() require("jdtls").extract_method() end,   desc = "Extract method" },
							},
						}
					})
				end
				wk.add({
					{
						{ "g",  group = "Extract" },
						{ "gD", vim.lsp.buf.declaration,        desc = "Declaration" },
						{ "gd", telescope.lsp_definitions,      desc = "Definition" },
						{ "gt", telescope.lsp_type_definitions, desc = "Type definition" },
						{ "gi", telescope.lsp_implementations,  desc = "Implementation" },
						{ "gr", telescope.lsp_references,       desc = "References" },
					},
					{
						{ "c",  group = "[C]ode" },
						{ "cH", vim.lsp.buf.hover,       desc = "Hover" },
						{ "cr", vim.lsp.buf.rename,      desc = "Rename" },
						{ "ca", vim.lsp.buf.code_action, desc = "Code action" },
					}
				})

				wk.add({
					{
						mode = "n",
						{
							{ "<leader>D",   group = "Debugging" },
							{ "<leader>Db",  dap.toggle_breakpoint,             desc = "Toggle breakpoint" },
							{ "<leader>Dc",  dap.continue,                      desc = "Continue debugging" },
							{ "<leader>Dsi", dap.step_into,                     desc = "Step into" },
							{ "<leader>Dsn", dap.step_over,                     desc = "Step over" },
							{ "<leader>Dr",  dap.repl.open,                     desc = "Open repl" },
							{ "<leader>Dh",  require("dapui").eval,             desc = "Evaluate expression" },
							{ "<leader>Dp",  require("dap.ui.widgets").preview, desc = "Preview expression" },
							{
								"<leader>Ds",
								function()
									local widgets = require("dap.ui.widgets")
									widgets.centered_float(widgets.scopes)
								end,
								desc = "Scopes"
							},
							{
								"<leader>Df",
								function()
									local widgets = require("dap.ui.widgets")
									widgets.centered_float(widgets.frames)
								end,
								desc = "Frames"
							},
						},
					},
					{
						mode = "v",
						{ "<leader>Dh", require("dapui").eval,             desc = "Evaluate expression" },
						{ "<leader>Dp", require("dap.ui.widgets").preview, desc = "Preview expression" },
					}
				})
			end
		})
	end
}
