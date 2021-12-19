local M = {}
local cmp_lsp = require("cmp_nvim_lsp")
local vim = vim

M.capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

return M
