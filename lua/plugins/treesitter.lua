return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    "windwp/nvim-ts-autotag"
  },
  event = "BufReadPost",
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
        }
      },
      autotag = {
        enable = true,
        filetype = { "heex", "typescriptreact", "html", "elixir" }
      },
    })
  end
}
