local handler = require('lsp.handlers')

require 'lspconfig'.volar.setup {
  capabilities = handler.capabilities,
  -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
