local lualine = require("lualine")
local M = {}

M.setup = function()
	lualine.setup({
		options = {
			-- theme = "one_dark",
			component_separators = {},
			section_separators = {},
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode", },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filesize", "filename" },
			lualine_x = {},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

return M
