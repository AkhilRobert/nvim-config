local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local M = {}

local sources = {
	-- ts, js
	-- prettier
	formatter.prettierd,

	-- eslint
	diagnostics.eslint_d,
	code_actions.eslint_d,

	--python
	formatter.black,
	formatter.isort,

	-- go
	formatter.gofumpt,
	diagnostics.revive,

	--git
	code_actions.gitsigns,
}

local on_attach = function()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	return function(client, bufnr)
		if client.supports_method("textDocument/formatting") or client.resolved_capabilities.document_formatting then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end
end

M.setup = function()
	null_ls.setup({
		sources = sources,
		on_attach = on_attach()
	})
end


return M
