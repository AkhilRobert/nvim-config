local lsp_status = require("lsp-status")

local M = {}

M.opts = {
	on_attach = function(client)
		lsp_status.on_attach(client)
		client.resolved_capabilities.document_formatting = false
	end,
}

return M
