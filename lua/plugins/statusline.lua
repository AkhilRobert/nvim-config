local lualine = require("lualine")
local lsp_status = require("lsp-status")
local icons = require("nvim-web-devicons")
local vim = vim
local M = {}

lsp_status.register_progress()

local function progress()
	local filetype = vim.bo.filetype
	local icon = icons.get_icon("", filetype)
	lsp_status.config({
		status_symbol = icon .. " " .. filetype,
		diagnostics = false,
	})
	return lsp_status.status_progress()
end

M.setup = function()
	lualine.setup({
		options = {
			theme = "solarized_dark",
			component_separators = {},
			section_separators = {},
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { progress },
			lualine_y = {},
			lualine_z = { "location" },
		},
	})
end

return M
