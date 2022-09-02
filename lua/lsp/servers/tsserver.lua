-- local typescript = require('typescript')
local ok, typescript = pcall(require, 'typescript')
if not ok then
	return
end

local handler = require('lsp.handlers')
local util = require('lua.utils')

local M = {}

-- Creates autocmd
M.setup = function()
	typescript.setup({
		server = {
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false

				-- Keymappings
				util.map("n", "<leader>ti", ":TypescriptAddMissingImports<CR>")
				util.map("n", "<leader>to", function()
					typescript.actions.organizeImports()
					typescript.actions.removeUnused()
				end)

			end,
			capabilities = handler.capabilities
		}
	})
end

return M
