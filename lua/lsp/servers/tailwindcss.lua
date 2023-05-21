local handler = require('lsp.handlers')

require 'lspconfig'.tailwindcss.setup {
  capabilities = handler.capabilities
}
