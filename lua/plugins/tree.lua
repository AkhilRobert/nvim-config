local nvim_tree = require("nvim-tree")
local M = {}

M.setup = function()
	nvim_tree.setup({
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		view = {
			width = 60,
		},
		respect_buf_cwd = true,
	})
end

return M
