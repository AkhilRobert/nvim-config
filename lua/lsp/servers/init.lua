local sumneko = require('lsp.servers.sumneko')
local prisma = require('lsp.servers.prisma')
local pyright = require('lsp.servers.pyright')
local gopls = require('lsp.servers.gopls')
local rust = require('lsp.servers.rust')
local clangd = require('lsp.servers.clangd')

local M = {}

M.setup = function()
	sumneko.setup()
	prisma.setup()
	pyright.setup()
	gopls.setup()
	rust.setup()
	clangd.setup()
end

return M
