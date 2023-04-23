return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = {},
      section_separators = {},
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode", },
      lualine_b = { "branch", "diagnostics" },
      lualine_c = { "filesize", "filename" },
      lualine_x = {},
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  }
}
