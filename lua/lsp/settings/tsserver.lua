local ts_utils = require("nvim-lsp-ts-utils")
local lsp_status = require("lsp-status")
local M = {}

local on_attach = function(client, bufnr)
	-- disables formatting
	client.resolved_capabilities.document_formatting = false

	ts_utils.setup({
		debug = false,
		disable_commands = false,
		enable_import_on_completion = false,
		auto_inlay_hints = false,
	})

	-- required to fix code action ranges and filter diagnostics
	ts_utils.setup_client(client)

	local opt = { silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opt)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opt)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opt)

	-- lsp_status does not work for client
	-- lsp_status.on_attach(client)
end

M.opts = {
	init_options = ts_utils.init_options,
	on_attach = on_attach,
}

return M
