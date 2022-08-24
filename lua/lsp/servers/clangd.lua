local lsp = require('lspconfig')
local handler = require('lsp.handlers')

local M = {}

local clangd_capabilities = {
	offsetEncoding = "utf-8"
}
local capabilities = vim.tbl_deep_extend('force', handler.capabilities, clangd_capabilities)


M.setup = function()
	lsp.clangd.setup {
		capabilities = capabilities,
		cmd = {
			"clangd",
			"-header-insertion=never"
		}
	}
end

return M
