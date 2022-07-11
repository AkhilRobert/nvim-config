local lsp = require('lspconfig')
local utils = require('nvim-lsp-ts-utils')

local M = {}

M.setup = function()
	lsp.tsserver.setup {
		init_options = utils.init_options,
		on_attach = function(client, buffer)
			-- disables language server formatting
			-- formatting is handled by
			client.resolved_capabilities.document_formatting = false

			utils.setup({
				debug = false,
				disable_commands = false,
				enable_import_on_completion = false,
				auto_inlay_hints = false,
			})

			-- required to fix code action ranges and filter diagnostics
			utils.setup_client(client)

			local opt = { silent = true }
			vim.api.nvim_buf_set_keymap(buffer, "n", "gs", ":TSLspOrganize<CR>", opt)
			vim.api.nvim_buf_set_keymap(buffer, "n", "gr", ":TSLspRenameFile<CR>", opt)
			vim.api.nvim_buf_set_keymap(buffer, "n", "gi", ":TSLspImportAll<CR>", opt)
		end
	}
end

return M
