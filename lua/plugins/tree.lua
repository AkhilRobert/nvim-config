local nvim_tree = require("nvim-tree")
local M = {}

vim.g.nvim_tree_respect_buf_cwd = 1

M.setup = function()
	nvim_tree.setup({
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
	})
end

return M
