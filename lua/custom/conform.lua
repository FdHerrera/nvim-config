require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort' },
    javascript = { 'prettier' },
    typescriptreact = { 'prettier' },
    javascriptreact = { 'prettier' },
  },
}
