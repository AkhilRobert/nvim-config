local ls = require('luasnip')
local tsserver = require('lsp.servers.tsserver')
local gopls = require('lsp.servers.gopls')

local M = {}

M.setup = function()
	ls.add_snippets(nil, {
		typescript = tsserver.snippets(),
		typescriptreact = tsserver.snippets(),
		go = gopls.snippets()
	})
end

return M
