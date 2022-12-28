local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local M = {}

M.setup = function()
  lsp.sumneko_lua.setup {
    settings = {
      Lua = {
        telementry = {
          enable = false,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
    capabilities = handler.capabilities
  }
end

return M
