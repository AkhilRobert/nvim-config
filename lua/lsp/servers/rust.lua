local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local M = {}

M.setup = function()
	lsp.rust_analyzer.setup {
		capabilities = handler.capabilities
	}
end

return M
