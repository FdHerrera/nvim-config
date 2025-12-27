local data = vim.fn.stdpath 'data'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local root_dir = require('jdtls.setup').find_root { 'gradlew', '.git', 'pom.xml' }

local java = os.getenv 'JAVA_HOME' .. '/bin/java'
local jdtls_base = data .. '/mason/packages/jdtls'
local workspace_folder = vim.fn.fnamemodify(root_dir, ':p:h:t')

-- Register dependency bundles for debuggin

local jar_patterns = {
  '/lazy/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
  '/lazy/vscode-java-test/server/*.jar',
}

local bundles = {}
for _, jar_pattern in ipairs(jar_patterns) do
  for _, bundle in ipairs(vim.split(vim.fn.glob(data .. jar_pattern), '\n')) do
    if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
      table.insert(bundles, bundle)
    end
  end
end

local config = {
  cmd = {
    java,

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. jdtls_base .. '/lombok.jar',

    '-jar',
    vim.fn.glob(jdtls_base .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    jdtls_base .. '/config_win', --[[ <- dependant on system ]]

    '-data',
    vim.fn.expand '~/.cache/jdtls-workspace/' .. workspace_folder,
  },

  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      {
        java = {
          signatureHelp = { enabled = true },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            toString = {
              template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
          },
        },
      },
    },
  },

  init_options = {
    bundles = bundles,
    extendedClientCapabilities = capabilities,
  },
  on_attach = require 'custom.utils',
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
