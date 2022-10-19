local c = require('vscode.colors')

local hl = vim.api.nvim_set_hl
vim.o.background = "dark"

require('vscode').setup {
	group_overrides = {
	}
}

hl(0, 'FidgetTitle', { fg = c.vscGreen, bg = 'NONE' })
hl(0, 'FidgetTask', { fg = c.vscGreen, bg = 'NONE' })
hl(0, 'TSConstant', { fg = "#4FC0FF", bg = 'NONE' }) -- To mimic vscode more
hl(0, 'variable', { fg = c.vscRed })
