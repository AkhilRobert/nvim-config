-- local lsp = require('lspconfig')
local handler = require('lsp.handlers')
local elixirls = require('elixir')

local M = {}

M.setup = function()
	elixirls.setup({
		capabilities = handler.capabilities,
		cmd = "/Users/akhilrobert/.local/share/nvim/mason/packages/elixir-ls/language_server.sh"
	})
end

return M
