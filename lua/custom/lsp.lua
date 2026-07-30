local servers = {
  docker_compose_language_service = {},
  dockerls = {},
  emmet_language_server = {},
  gopls = {},
  gradle_ls = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = {
          vim.fn.stdpath('data') .. '/lazy/types',
          vim.env.VIMRUNTIME .. '/lua',
        },
      },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
  pyright = {},
  ts_ls = {},
  vimls = {},
  yamlls = {
    yaml = {
      schemas = { kubernetes = '*.yaml' },
    },
  },
}

require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = require 'custom.utils'

for name, config in pairs(servers) do
  vim.lsp.config(name, {
    capabilities = capabilities,
    settings = config,
    on_attach = on_attach,
  })
end

vim.lsp.enable(vim.tbl_keys(servers))
