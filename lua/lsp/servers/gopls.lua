local lsp = require('lspconfig')

local M = {}

M.setup = function()
	lsp.gopls.setup {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end
	}
end

return M
