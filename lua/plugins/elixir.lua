return {
  "elixir-tools/elixir-tools.nvim",
  ft = { "elixir", "eex", "heex", "surface" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")
    local handler = require("lsp.handlers")

    elixir.setup {
      credo = {},
      elixirls = {
        capabilities = handler.capabilities,
        cmd = "/Users/akhilrobert/.local/share/nvim/mason/packages/elixir-ls/language_server.sh",
        enabled = true,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
