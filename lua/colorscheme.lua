local c = require('vscode.colors').get_colors()
local vscode = require('vscode')

local hl = vim.api.nvim_set_hl
vim.o.background = "dark"
vscode.setup({
  group_overrides = {
    ['@constant'] = { fg = "#4FC0FF", bg = 'NONE' },
    DiagnosticUnnecessary = { underline = true },
    ['@text.title'] = {},
    ['@text.title.1'] = { fg = c.vscBlue, bold = true },
    ['@text.title.2'] = { fg = c.vscBlue, bold = true }
  }
})
vscode.load()
