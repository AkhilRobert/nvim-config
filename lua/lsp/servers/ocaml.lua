local lsp = require('lspconfig')
local handler = require('lsp.handlers')

lsp.ocamllsp.setup({
  capabilities = handler.capabilities,
})
