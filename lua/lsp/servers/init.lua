local sumneko = require('lsp.servers.sumneko')
local tsserver = require('lsp.servers.tsserver')
local prisma = require('lsp.servers.prisma')

local M = {}

M.setup = function()
	sumneko.setup()
	tsserver.setup()
	prisma.setup()
end

return M
