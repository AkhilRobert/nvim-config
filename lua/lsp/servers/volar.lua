local handler = require('lsp.handlers')

require 'lspconfig'.volar.setup {
  capabilities = handler.capabilities,
}
