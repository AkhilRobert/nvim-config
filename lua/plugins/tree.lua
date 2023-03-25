local neo_tree = require('neo-tree')
local M = {}


M.setup = function()
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  neo_tree.setup({
    default_component_configs = {
      icon = {
        folder_closed = '',
        folder_open   = ''
      },
      indent = {
        indent_size = 3
      }
    },
    git_status = {
      symbols = {
        modified = ""
      }
    },
    -- TODO: currently it is lazy fix make sure it takes the whole buffer
    window = {
      position = "right",
    }
  })
end

return M
