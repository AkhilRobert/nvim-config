return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local handler = require('lsp.handlers')

    local root_markers = { 'gradlew', 'pom.xml' }
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')
    local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local jdtls = require('jdtls')

    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    local config = {
      cmd = {

        -- 💀
        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar',
        vim.fn.expand(
          vim.fn.stdpath("data") ..
          '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),

        '-configuration',
        (vim.fn.stdpath("data") .. '/mason/packages/jdtls/config_mac/'), -- This is hardcoded for mac
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.


        -- 💀
        -- See `data directory configuration` section in the README
        '-data', workspace_folder,
      },

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
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

      -- Language server `initializationOptions`
      -- You need to extend the `bundles` with paths to jar files
      -- if you want to use additional eclipse.jdt.ls plugins.
      --
      -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
      --
      -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
      flags = {
        allow_incremental_sync = true,
      },
      init_options = {
        bundles = {}
      },
      capabilities = handler.capabilities,
      on_attach = function()
        require('jdtls').setup.add_commands()
      end
    }

    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.

    require('jdtls').start_or_attach(config)
  end
}
