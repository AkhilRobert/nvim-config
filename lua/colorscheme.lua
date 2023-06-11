local c = require('vscode.colors').get_colors()

local hl = vim.api.nvim_set_hl
vim.o.background = "dark"

require('vscode').load()

hl(0, '@constant', { fg = "#4FC0FF", bg = 'NONE' }) -- To mimic vscode more
hl(0, 'DiagnosticUnnecessary', {}) -- removes highlight group for `DiagnosticUnnecessary`

-- require("tokyonight").setup({
--   styles = {
--     keywords = {
--       italic = false,
--     }
--   }
-- })
-- vim.cmd [[colorscheme tokyonight]]
