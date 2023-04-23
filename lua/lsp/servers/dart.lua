-- local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local flutter_tools = require('flutter-tools')

local M = {}

M.setup = function()
  -- lsp.dartls.setup({
  --   capabilities = handler.capabilities
  -- })
  flutter_tools.setup({
    lsp = {
      capabilities = handler.capabilities
    }
  })
end

return M