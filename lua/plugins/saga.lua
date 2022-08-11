local saga = require('lspsaga')

local M = {}

M.setup = function()
	saga.init_lsp_saga({
		code_action_lightbulb = {
			enable = false
		},
		move_in_saga = {
			prev = "<C-b>",
			next = "<C-f>"
		}
	})
end

return M