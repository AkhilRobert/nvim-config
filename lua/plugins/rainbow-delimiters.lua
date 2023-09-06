return {
  "HiPhish/rainbow-delimiters.nvim",
  enabled = true,
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
