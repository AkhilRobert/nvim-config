local neo_tree = require('neo-tree')
local M = {}


M.setup = function() neo_tree.setup({
		hijack_netrw_behavior = "open_default",
		window = {
			position = "right",
			width = 60
		},
		default_component_configs = {
			icon = {
				folder_closed = '',
				folder_open   = ''
			}
		}
	})
end

return M
