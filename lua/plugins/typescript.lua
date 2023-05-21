return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact", "javascriptreact", "javascript" },
  config = function()
    local handler = require('lsp.handlers')
    require('typescript').setup({
      capabilities = handler.capabilities
    })
  end
}
