local telescope = require("telescope")
local M = {}

M.setup = function()
	telescope.setup({
		pickers = {
			find_files = {
				theme = "ivy",
				file_ignore_patterns = { "node%_modules/.*" }
			},
			live_grep = {
				theme = "ivy",
				file_ignore_patterns = { "node%_modules/.*" }
			},
			buffers = {
				theme = "ivy",
			},
			diagnostics = {
				theme = "ivy",
			}
		},
	})
end

return M
