local lsp = require('lspconfig')
local handler = require('lsp.handlers')

lsp.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        -- type checker
        pylsp_mypy = { enabled = true },
      },
    },
  },
  handler = handler.capabilities
}
