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
		rainbow = {
			enable = false,
			disable = { "html" },
			extended_mode = false,
			colors = { "#00A0FF", "#FFD300", "#EA66DC" },
		},
	})
end

return M
