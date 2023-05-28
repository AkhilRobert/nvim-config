return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      {
        "AkhilRobert/nvim-ts-rainbow2",
        {
        }
      }
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
          disable = { "python", "elixir" }
        },
        incremental_selection = {
          enable = true
        },
        context_commentstring = {
          enable = true,
        },
        autotag = {
          enable = true,
          filetype = { "heex", "typescriptreact", "html", }
        },
        rainbow = {
          enable = true,
          hlgroups = {
            "TSRainbowYellow",
            "TSRainbowMagenta",
            "TSRainbowBlue",
          },
        }
      })
    end
  },
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" }
  },
}
