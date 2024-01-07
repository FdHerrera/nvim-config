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
		vim.keymap.set("n", "n", "nzzzv")
		vim.keymap.set("n", "N", "Nzzzv")
		wk.register({
			s = { "<cmd>w<CR>", "Saves file" },
			["wq"] = { ":wq<Enter>", "Saves and quits" },
			e = { vim.cmd.Ex, "Explorer" },
			f = {
				name = "Telescope",
				f = { telescope.find_files, "Search Files" },
				g = { telescope.git_files, "Find in Git" },
				d = { telescope.diagnostics, "Diagnostics" },
				s = { telescope.live_grep, "Search in files content" },
				b = { telescope.buffers, "Search buffers" },
				h = { telescope.help_tags, "Search in tags" },
			},
			g = {
				name = "Git",
				s = { vim.cmd.Git, "Git status" },
				p = { ":Git push<CR>", "Push" },
				u = { ":Git pull<CR>", "Pull" },
				a = { ":Git add %<CR>", "Add all" },
			},
			v = {
				s = { ":vert sb<CR>", "Vertical split" },
			},
			q = { ":q<CR>", "Quit" },
			[";"] = { "A;<ESC>", "Append ';' to end of line" },
			F = { vim.lsp.buf.format, "Format file" },
			h = {
				name = "Harpoon",
				a = {
					function()
						harpoon:list():append()
					end,
					"Add file" },
				m = {
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					"Menu" },
			},
			k = { vim.diagnostic.open_float, "Open diagnostic" },
			["[d"] = { vim.diagnostic.goto_prev, "Prev diagnostic" },
			["'d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
			-- Ignore switchings in harpoon
			["1"] = "which_key_ignore",
			["2"] = "which_key_ignore",
			["3"] = "which_key_ignore",
			["4"] = "which_key_ignore",
			["5"] = "which_key_ignore",
			["6"] = "which_key_ignore",
			["7"] = "which_key_ignore",
			["8"] = "which_key_ignore",
			["9"] = "which_key_ignore",
			-- Ignore switchings in harpoon
		}, { prefix = "<leader>" })
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('key-bindings', { clear = true }),
			callback = function(args)
				local client_id = args.data.client_id
				local client = vim.lsp.get_client_by_id(client_id)
				if client.name == "jdtls" then
					wk.register({
						i = {
							function()
								require("jdtls").organize_imports()
							end,
							"Organize imports",
						},
						x = {
							name = "Extract",
							v = {
								function()
									require("jdtls").extract_variable()
								end,
								"Extract variable",
							},
							c = {
								function()
									require("jdtls").extract_constant()
								end,
								"Extract constant",
							},
						},
					}, { prefix = "<leader>" })

					wk.register({
						i = {
							function()
								require("jdtls").organize_imports()
							end,
							"Organize imports",
						},
						x = {
							name = "Extract",
							v = {
								function()
									require("jdtls").extract_variable()
								end,
								"Extract variable",
							},
							c = {
								function()
									require("jdtls").extract_constant()
								end,
								"Extract constant",
							},
							m = {
								function()
									require("jdtls").extract_method()
								end,
								"Extract method",
							}
						},
					}, { prefix = "<leader>", mode = "v" })
				end
				wk.register({
					g = {
						name = "Go to",
						D = { vim.lsp.buf.declaration, "Declaration" },
						d = { telescope.lsp_definitions, "Definition" },
						t = { telescope.lsp_type_definitions, "Type definition" },
						i = { telescope.lsp_implementations, "Implementation" },
						r = { telescope.lsp_references, "References" },
					},
					H = { vim.lsp.buf.hover, "Hover" },
					r = { vim.lsp.buf.rename, "Rename" },
					["ca"] = { vim.lsp.buf.code_action, "Code action" },
				})

				-- NORMAL MAPPINGS --

				wk.register({
					d = {
						name = "Debugging",
						b = {
							dap.toggle_breakpoint,
							"Toggle breakpoint",
						},
						c = {
							dap.continue,
							"Continue debugging",
						},
						["si"] = {
							dap.step_into,
							"Step into",
						},
						["sn"] = {
							dap.step_over,
							"Step over",
						},
						r = {
							dap.repl.open,
							"Open repl",
						},
						h = {
							require("dapui").eval,
							"Evaluate expression",
						},
						p = {
							require("dap.ui.widgets").preview,
							"Preview expression",
						},
						f = {
							function()
								local widgets = require("dap.ui.widgets")
								widgets.centered_float(widgets.frames)
							end,
							"Frames",
						},
						s = {
							function()
								local widgets = require("dap.ui.widgets")
								widgets.centered_float(widgets.scopes)
							end,
							"Scopes",
						},
						t = {
							function()
								require("neotest").run.run({ strategy = "dap" })
							end,
							"Debug nearest test"
						}
					},
				}, { prefix = "<leader>" })

				-- NORMAL MAPPINGS --

				-- VISUAL MAPPINGS --

				wk.register({
					d = {
						name = "Debugging",
						h = {
							function()
								require("dapui").eval()
							end,
							"Evaluate expression",
						},
						p = {
							function()
								require("dap.ui.widgets").preview()
							end,
							"Preview expression",
						},
					},
				}, { prefix = "<leader>", mode = "v" })

				-- VISUAL MAPPINGS --
			end
		})
	end
}
