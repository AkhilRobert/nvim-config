local lsp = require('lspconfig')

local M = {}

M.setup = function()
	lsp.rust_analyzer.setup {}
end

return M
