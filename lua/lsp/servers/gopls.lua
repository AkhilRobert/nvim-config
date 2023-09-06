local lsp = require('lspconfig')
local handler = require('lsp.handlers')

lsp.gopls.setup {
  on_attach = function(client)
    -- client.server_capabilities.document_formatting = false
  end,
  capabilities = handler.capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      semanticTokens = true,
    }
  }
}
