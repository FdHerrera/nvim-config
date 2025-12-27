return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neotest/neotest-go',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/nvim-nio',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
    local neotest = require 'neotest'
    require('neotest').setup {
      adapters = {
        require 'neotest-go',
      },
    }
    require('which-key').add {
      { '<leader>t', group = 'Tests' },
      { '<leader>ts', neotest.run.stop, desc = 'Stop test run' },
      {
        '<leader>tt',
        function()
          if vim.bo.filetype == 'java' then
            require('jdtls').test_nearest_method()
          else
            neotest.run.run()
          end
        end,
        desc = 'Run nearest',
      },
      {
        '<leader>tT',
        function()
          if vim.bo.filetype == 'java' then
            require('jdtls').test_nearest_method()
          else
            neotest.run.run()
          end
        end,
        desc = 'Run nearest',
      },
    }
  end,
}
