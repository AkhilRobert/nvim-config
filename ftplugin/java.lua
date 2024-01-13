local o = vim.o

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

local handler = require('lsp.handlers')

local root_markers = { 'gradlew', 'pom.xml' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/.cache/java-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls = require('jdtls')

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local capabilities = vim.tbl_deep_extend('force', handler.capabilities, {
  server_capabilities = {
    semanticTokensProvider = 'full'
  }
})

local lombok_config = string.format(
  "-javaagent:%s",
  vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"))

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
    lombok_config,
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
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

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
  capabilities = capabilities,
  on_attach = function()
    require('jdtls').setup.add_commands()
  end
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.

require('jdtls').start_or_attach(config)
