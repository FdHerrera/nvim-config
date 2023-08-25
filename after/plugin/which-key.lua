local wk = require("which-key")

local mark = require("harpoon.mark")
local harpoon = require("harpoon.ui")
local telescope = require("telescope.builtin")

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
			t = {
				function()
					if is_java_file() then
						require("jdtls").test_nearest_method()
					else
						vim.cmd("TestNearest")
					end
				end,
				"Test nearest",
			},
			T = {
				function()
					if is_java_file() then
						require("jdtls").test_class()
					else
						vim.cmd("TestClass")
					end
				end,
				"Test class",
			},
			["tl"] = { ":TestLast<CR>", "Test last" },
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
				},
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
	a = { mark.add_file, "Harpoon add file" },
	h = {
		m = { harpoon.toggle_quick_menu, "Harpoon menu" },
	},
	k = { vim.diagnostic.open_float, "Open diagnostic" },
	["[d"] = { vim.diagnostic.goto_prev, "Prev diagnostic" },
	["'d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
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
					function()
						require("dap").toggle_breakpoint()
					end,
					"Toggle breakpoint",
				},
				c = {
					function()
						require("dap").continue()
					end,
					"Continue debugging",
				},
				["si"] = {
					function()
						require("dap").step_into()
					end,
					"Step into",
				},
				["sn"] = {
					function()
						require("dap").step_over()
					end,
					"Step over",
				},
				r = {
					function()
						require("dap").repl.open()
					end,
					"Open repl",
				},
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
		harpoon.nav_file(i)
	end)
end
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")