local lsp = require('lspconfig')
local ft = require('Comment.ft')
local M = {}

-- set's up comment string for prisma
ft.set('prisma', '//%s')

M.setup = function()
	lsp.prismals.setup {}
end

return M
