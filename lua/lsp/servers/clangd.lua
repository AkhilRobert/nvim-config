local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local clangd_capabilities = {
  offsetEncoding = "utf-8"
}
local capabilities = vim.tbl_deep_extend('force', handler.capabilities, clangd_capabilities)

lsp.clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--clang-tidy",
    "-header-insertion=never",
  }
}
