local lsp = require('lspconfig')
local M = {}

M.setup = function()
	lsp.prismals.setup {}
end

return M
