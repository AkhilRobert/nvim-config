return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  event = "BufReadPost",
  config = function()
    require('mason-lspconfig').setup()
  end
}
