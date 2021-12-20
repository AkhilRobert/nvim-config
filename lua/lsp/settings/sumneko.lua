local lsp_status = require("lsp-status")
local M = {}

M.opts = {
	on_attach = lsp_status.on_attach,
	settings = {
		Lua = {
			telementry = {
				enable = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
}

return M
