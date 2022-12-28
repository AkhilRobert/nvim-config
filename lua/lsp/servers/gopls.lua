local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local M = {}

M.setup = function()
  lsp.gopls.setup {
    on_attach = function(client)
      client.server_capabilities.document_formatting = false
    end,
    capabilities = handler.capabilities
  }
end

return M
