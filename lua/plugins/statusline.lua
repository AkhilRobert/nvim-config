local lualine = require("lualine")
local M = {}

M.setup = function()
	lualine.setup({
		options = {
			theme = "codedark",
		},
	})
end

return M
