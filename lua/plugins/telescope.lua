local telescope = require("telescope")
local M = {}

M.setup = function()
	telescope.setup({
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				file_ignore_patterns = { "node%_modules/.*" }
			},
			live_grep = {
				theme = "dropdown",
				layout_config = {
					prompt_position = "bottom",
				},
				file_ignore_patterns = { "node%_modules/.*" }
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
