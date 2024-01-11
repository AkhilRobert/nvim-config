return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim', },
  keys = {
    { "ff", "<cmd>Telescope find_files<CR>" },
    { "fg", "<cmd>Telescope live_grep<CR>" },
    { "fb", "<cmd>Telescope buffers<CR>" },
    { "fd", "<cmd>Telescope diagnostics<CR>" },
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          theme = "ivy",
          file_ignore_patterns = { "node%_modules/.*" }
        },
        live_grep = {
          theme = "ivy",
          file_ignore_patterns = { "node%_modules/.*" }
        },
        buffers = {
          theme = "ivy",
        },
        diagnostics = {
          theme = "ivy",
        }
      },

      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    })

    require("telescope").load_extension("ui-select")
  end
}
