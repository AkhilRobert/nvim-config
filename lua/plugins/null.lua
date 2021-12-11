local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
local formatter = null_ls.builtins.formatting
local M = {}

local sources = {
	-- ts, js
	formatter.prettier,

	-- python
	formatter.black,
	formatter.isort,

	-- lua
	formatter.stylua,
}

M.setup = function()
	null_ls.config({ sources = sources })
	lspconfig["null-ls"].setup({
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

return M
