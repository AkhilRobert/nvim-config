local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local M = {}

M.setup = function()
	lsp.rust_analyzer.setup {
		capabilities = handler.capabilities,
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				}
			}
		}
	}
end

return M
