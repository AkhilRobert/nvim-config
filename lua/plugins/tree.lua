local neo_tree = require('neo-tree')
local M = {}

M.setup = function()
	neo_tree.setup({
		hijack_netrw_behavior = "open_default"
	})
end

return M
