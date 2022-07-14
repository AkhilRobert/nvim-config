local sumneko = require('lsp.servers.sumneko')
local tsserver = require('lsp.servers.tsserver')
local prisma = require('lsp.servers.prisma')
local pyright = require('lsp.servers.pyright')
local gopls = require('lsp.servers.gopls')

local M = {}

M.setup = function()
	sumneko.setup()
	tsserver.setup()
	prisma.setup()
	pyright.setup()
	gopls.setup()
end

return M
