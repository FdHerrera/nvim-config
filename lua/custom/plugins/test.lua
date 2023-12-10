return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-go",
    "antoinemadec/FixCursorHold.nvim"
  },
  config = function()
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    local neotest = require("neotest")
    require("neotest").setup({
      adapters = {
        require("neotest-go"),
      },
    })
    local wk = require("which-key")
    wk.register({
      t = {
        name = "Tests",
        t = {
          neotest.run.run,
          "Run nearest"
        },
        T = {
          function()
            require("neotest").run.run(vim.fn.expand("%"))
          end,
          "Run file"
        },
        s = {
          neotest.run.stop,
          "Stop test run"
        }
      }
    }, { prefix = "<leader>" })
  end,
}
