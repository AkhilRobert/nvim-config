-- require("catppuccin").setup({
--   flavor = "frappe",
--   no_italic = true,
--   no_bold = true
-- })
--
-- vim.cmd.colorscheme "catppuccin-frappe"
--
require('vscode').setup({
  group_overrides = {
    -- DiagnosticUnnecessary = { underline = true },
  }
})
require('vscode').load()
