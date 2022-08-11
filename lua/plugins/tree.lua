local neo_tree = require('neo-tree')
local M = {}


M.setup = function() neo_tree.setup({
		default_component_configs = {
			icon = {
				folder_closed = '',
				folder_open   = ''
			},
			indent = {
				indent_size = 3
			}
		},
		git_status = {
			symbols = {
				modified = ""
			}
		},
		window = {
			position = "right",
			width = 60
		}
	})
end

return M
