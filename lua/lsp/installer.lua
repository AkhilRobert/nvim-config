local lsp_installer = require("nvim-lsp-installer")
local nvim_cmp = require("cmp_nvim_lsp")

local tsserver = require("lsp.settings.tsserver")
local jsonls = require("lsp.settings.jsonls")
local sumneko = require("lsp.settings.sumneko")
local gopls = require("lsp.settings.gopls")

lsp_installer.on_server_ready(function(server)
	local opts = { capabilities = nvim_cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()) }

	if server.name == "tsserver" then
		opts = vim.tbl_deep_extend("force", tsserver.opts, opts)
	end

	if server.name == "sumneko_lua" then
		opts = vim.tbl_deep_extend("force", sumneko.opts, opts)
	end

	if server.name == "jsonls" then
		opts = vim.tbl_deep_extend("force", jsonls.opts, opts)
	end

	if server.name == "gopls" then
		opts = vim.tbl_deep_extend("force", gopls.opts, opts)
	end

	server:setup(opts)
end)
