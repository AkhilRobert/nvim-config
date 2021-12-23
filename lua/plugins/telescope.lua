local telescope = require("telescope")
local M = {}

M.setup = function()
	telescope.setup({
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
			},
			live_grep = {
				theme = "dropdown",
				layout_config = {
					prompt_position = "bottom",
				},
			},
			buffers = {
				theme = "dropdown",
				layout_config = {
					prompt_position = "bottom",
				},
			},
		},
	})
end

return M
