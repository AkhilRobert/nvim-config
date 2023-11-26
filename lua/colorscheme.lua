local c = require('vscode.colors').get_colors()
local vscode = require('vscode')

vim.o.background = "dark"

local c_constant = "#4FC0FF"

vscode.setup({
  group_overrides = {
    ['@constant'] = { fg = c_constant, bg = 'NONE' },
    DiagnosticUnnecessary = { underline = true },
    ['@text.title'] = {},
    ['@text.title.1'] = { fg = c.vscBlue, bold = true },
    ['@text.title.2'] = { fg = c.vscBlue, bold = true },
    ['@lsp.typemod.variable.constant.rust'] = { fg = c_constant },
    ['@lsp.typemod.variable.readonly.typescriptreact'] = { fg = c_constant },
    ['@lsp.typemod.variable.readonly.go'] = { fg = c_constant },
  }
})
vscode.load()


-- require("tokyonight").setup({
--   styles = {
--     comments = { italic = true },
--     keywords = { italic = false },
--     functions = {},
--     variables = {},
--   },
-- })
--
-- vim.cmd [[colorscheme tokyonight]]
