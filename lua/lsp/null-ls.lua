local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local M = {}

local sources = {
	-- ts, js
	formatter.prettierd,

	diagnostics.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js")
		end,
	}),
	code_actions.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js")
		end,
	}),
	-- python
	formatter.black,
	formatter.isort,

	-- go
	formatter.gofumpt,
	diagnostics.revive,

	-- lua
	formatter.stylua,
}

M.setup = function()
	null_ls.setup({
		sources = sources,
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

return M
