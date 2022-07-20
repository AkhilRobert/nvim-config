local typescript = require('typescript')
local handler = require('lsp.handlers')

local M = {}

-- Creates autocmd
M.setup = function()
	typescript.setup({
		server = {
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
			end,
			capabilities = handler.capabilities
		}
	})
end

return M
