-- This order is important
require('mason').setup()
require('mason-lspconfig').setup()

-- Servers I want
local servers = {
  docker_compose_language_service = {},
  dockerls = {},
  emmet_language_server = {},
  elixirls = {},
  gopls = {},
  gradle_ls = {},
  graphql = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
  pyright = {},
  tailwindcss = {},
  vimls = {},
  volar = {},
  yamlls = {
    yaml = {
      schemas = { kubernetes = "*.yaml" }
    }
  },
}


require('neodev').setup({
  library = { plugins = { "neotest" }, types = true }
})

-- Default capabilities I want in every server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local on_attach = require("custom.utils")

mason_lspconfig.setup_handlers {
  function(server_name)
    -- jdtls is so special it needs to be configured in ftplugin/java.lua
    if 'jdtls' == server_name then
      return
    end

    local lsp_config = require('lspconfig')

    lsp_config[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
