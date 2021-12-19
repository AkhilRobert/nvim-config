local M = {}

M.opts = {
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
