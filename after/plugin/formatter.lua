-- Utilities for creating configurations
local defaults = require("formatter.defaults")
local util = require("formatter.util")
local custom_style = vim.fn.stdpath("config") .. "/styles/custom-style.clang-format"
local stdin_exe = function(executable)
	return {
		exe = executable,
		args = {
			"-",
		},
		stdin = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		java = {
			require("formatter.filetypes.java").clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						"--style=file:" .. custom_style,
						"--assume-filename=.java",
					},
					stdin = true,
				}
			end,
		},
		vue = { util.withl(defaults.eslint_d, "vue") },
		json = {
			require("formatter.filetypes.json").prettier,
		},
		xml = { stdin_exe("xmlformat") },
		yaml = { stdin_exe("yamlfmt") },
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
