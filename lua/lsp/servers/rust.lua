local lsp = require('lspconfig')
local handler = require('lsp.handlers')

lsp.rust_analyzer.setup {
  capabilities = handler.capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}
