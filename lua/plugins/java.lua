return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require('jdtls')
    local handler = require('lsp.handlers')
    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    local root_markers = { 'gradlew', 'pom.xml' }
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')
    local workspace_folder = home .. "/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        vim.fn.expand(
          vim.fn.stdpath('data') .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        vim.fn.stdpath('data') .. 'mason/packages/jdtls/config_mac',
        '-data', workspace_folder,
      },
      root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = 'fernflower' },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*"
            }
          },
        }
      },
      flags = {
        allow_incremental_sync = true,
      },
      init_options = {
        bundles = {}
      },
      capabilities = handler.capabilities,
      extendedClientCapabilities = extendedClientCapabilities
    }

    jdtls.start_or_attach(config)
    jdtls.setup.add_commands()
  end
}
