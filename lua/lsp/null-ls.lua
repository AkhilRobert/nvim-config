local null_ls = require("null-ls")
local U = require("utils")

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local M = {}

-- Fixes eslint no configuration found
-- only runs if there is eslint present installed locally rather than using
-- the global one.
local eslint_d = function()
	local project_local_bin = "node_modules/.bin/eslint"

	return null_ls.builtins.diagnostics.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file(project_local_bin) and project_local_bin
		end
	})
end

local revive = function()
	local config_filename = 'revive.toml'
	local args = { "-formatter", "json" }
	local exists = U.file_exists_cwd(config_filename)
	if exists then
		table.insert(args, "-config")
		table.insert(args, config_filename)
	end

	table.insert(args, "./...")

	return diagnostics.revive.with({
		args = args
	})
end

local sources = {
	-- ts, js
	-- prettier
	formatter.prettierd,

	-- eslint
	eslint_d(),
	code_actions.eslint_d,

	--python
	formatter.black,
	formatter.isort,

	-- go
	formatter.gofumpt,
	formatter.goimports,
	revive(),

	-- rust
	formatter.rustfmt,

	-- spelling
	diagnostics.codespell

	--git
	-- code_actions.gitsigns,
}

local on_attach = function()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	return function(_, bufnr)
		-- Autocmd for formatting on save
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

M.setup = function()
	null_ls.setup({
		sources = sources,
		on_attach = on_attach()
	})
end

return M
