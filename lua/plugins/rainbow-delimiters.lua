return {
  "HiPhish/rainbow-delimiters.nvim",
  enabled = false,
  config = function()
    vim.g.rainbow_delimiters = {
      highlight = {
        "TSRainbowYellow",
        "TSRainbowMagenta",
        "TSRainbowBlue"
      },
      blacklist = { 'html' }
    }
  end
}
