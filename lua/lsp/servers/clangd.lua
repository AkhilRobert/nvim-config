local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local M = {}

local clangd_capabilities = handler.capabilities
clangd_capabilities.offsetEncoding = 'utf-8'

M.setup = function()
	lsp.clangd.setup {
		capabilities = clangd_capabilities,
	}
end

return M
