local typescript = require('typescript')

local M = {}

-- Creates autocmd
M.setup = function()
	typescript.setup({
		server = {
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
			end
		}
	})
end

return M
