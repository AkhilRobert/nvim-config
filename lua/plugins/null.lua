local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting

local sources = {
	formatter.prettier,

	-- python
	formatter.black,
	formatter.isort,

	-- lua
	formatter.stylua,
}

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup({
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
