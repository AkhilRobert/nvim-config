local handler = require('lsp.handlers')

require 'lspconfig'.volar.setup {
  capabilities = handler.capabilities,
  init_options = {
    serverMode = 0
  }
}
