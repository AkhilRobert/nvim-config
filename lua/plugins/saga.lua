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
    }
  })
end

return M
