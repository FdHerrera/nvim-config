local wk = require("which-key")

local harpoon = require("harpoon")
local telescope = require("telescope.builtin")
local dap = require('dap')

local function is_java_file()
	local buffer_file_name = vim.api.nvim_buf_get_name(0)
	local java_file = ".java"
	if buffer_file_name == nil then
		return
	end
	return buffer_file_name:sub(-string.len(java_file)) == java_file
end

local function register_java_maps()
	if is_java_file() then
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
		}, { prefix = "<space>" })

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
		}, { prefix = "<space>", mode = "v" })
	end
end

wk.register({
	s = { "<cmd>w<CR>", "Saves file" },
	["wq"] = { ":wq<Enter>", "Saves and quits" },
	e = { vim.cmd.Ex, "Explorer" },
	f = {
		name = "Telescope",
		f = { telescope.find_files, "Search Files" },
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
	F = { ":Format<CR>", "Format file" },
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
}, { prefix = "<space>" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function()
		-- Mappings with no prefix --
		wk.register({
			g = {
				name = "Go to",
				D = { vim.lsp.buf.declaration, "Declaration" },
				d = { vim.lsp.buf.definition, "Definition" },
				t = { vim.lsp.buf.type_definition, "Type definition" },
				i = { vim.lsp.buf.implementation, "Implementation" },
				r = { vim.lsp.buf.references, "References" },
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

		register_java_maps()
	end,
})

-- Silent keymaps
for i = 1, 9 do
	vim.keymap.set("n", "<space>" .. i, function()
		harpoon:list():select(i)
	end)
end
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

return {}
