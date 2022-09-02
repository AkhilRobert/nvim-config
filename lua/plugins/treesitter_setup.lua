local treesitter = require("nvim-treesitter.configs")
local M = {}

M.setup = function()
	treesitter.setup({
		ensure_installed = { "python", "lua", "html", "typescript", "javascript", "tsx" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true
		},
		incremental_selection = {
			enable = true
		},
		rainbow = {
			enable = true,
			extended_mode = false,
			disable = { "html" },
			colors = { "#FFD300", "#00A0FF", "#FFD300" }
		},
	})
end

return M
