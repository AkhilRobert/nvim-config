vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
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
  },
  keys = {
    { "<leader>e", "<CMD>Neotree current toggle reveal_force_cwd<CR>" }
  }
}
