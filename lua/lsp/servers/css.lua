local lsp = require('lspconfig')
local handler = require('lsp.handlers')

lsp.cssls.setup {
  capabilities = handler.capabilities,
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore"
      }
    }
  }
}
