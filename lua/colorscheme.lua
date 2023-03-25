local c = require('vscode.colors').get_colors()

local hl = vim.api.nvim_set_hl
vim.o.background = "dark"

require('vscode').load()

hl(0, '@constant', { fg = "#4FC0FF", bg = 'NONE' }) -- To mimic vscode more

-- Lsp saga colors
hl(0, 'SagaBorder', { fg = 'NONE', bg = c.vscBack })
hl(0, 'RenameNormal', { fg = c.vscFront, bg = c.vscBack })
