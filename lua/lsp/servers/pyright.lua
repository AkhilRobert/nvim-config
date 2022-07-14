local lsp = require('lspconfig')

local M = {}

M.setup = function()
	lsp.pyright.setup {}
end

return M
