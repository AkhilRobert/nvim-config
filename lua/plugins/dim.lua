return {
  "0oAstro/dim.lua",
  dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  event = "LspAttach",
  config = function()
    require('dim').setup()
  end
}
