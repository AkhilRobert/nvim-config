local saga = require('lspsaga')

local M = {}

M.setup = function()
  saga.setup({
    code_action_lightbulb = {
      enable = false
    },
    code_action_num_shortcut = true,
    move_in_saga = {
      prev = "<C-b>",
      next = "<C-f>"
    },
    ui = {
      border = 'rounded'
    },
    symbol_in_winbar = {
      enable = false
    }
  })
end

return M
