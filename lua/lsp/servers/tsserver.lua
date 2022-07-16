local typescript = require('typescript')

local M = {}

-- Creates autocmd
local register_cmd = function()
	local group = vim.api.nvim_create_augroup("OrganizeImports", { clear = true })

	-- Runs organizeImports on file save
	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = { "*.ts", "*.tsx" },
		callback = function()
			typescript.actions.organizeImports({ sync = true })
		end,
		group = group
	})

end

M.setup = function()
	register_cmd()

	typescript.setup({
		server = {
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
			end
		}
	})
end

return M
