return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact", "javascriptreact", "javascript" },
  config = function()
    require('typescript').setup({})
  end
}
