return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "HiPhish/nvim-ts-rainbow2", dev = true },
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = { "python" }
        },
        incremental_selection = {
          enable = true
        },
        context_commentstring = {
          enable = true,
        },
        rainbow = {
          enable = true,
          hlgroups = {
            'TSRainbowGolden',
            'TSRainbowPink',
            'TSRainbowBlue',
          },
          query = {
            'rainbow-parens',
            html = 'rainbow-parens'
          },
          extended_mode = true,
        },
        autotag = {
          enable = true,
          filetype = { "heex", "typescriptreact", "html", "elixir" }
        },
      })
    end
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  },
}
