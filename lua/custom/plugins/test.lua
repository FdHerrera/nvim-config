return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-go",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
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
          function()
            if vim.bo.filetype == 'java' then
              require('jdtls').test_nearest_method()
            else
              neotest.run.run()
            end
          end,
          "Run nearest"
        },
        T = {
          function()
            if vim.bo.filetype == 'java' then
              require('jdtls').test_nearest_method()
            else
              require("neotest").run.run(vim.fn.expand("%"))
            end
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
