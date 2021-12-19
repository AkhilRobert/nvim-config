local lsp_installer = require("nvim-lsp-installer")
local handler = require("lsp.handlers")

local tsserver = require("lsp.settings.tsserver")
local jsonls = require("lsp.settings.jsonls")
local sumneko = require("lsp.settings.sumneko")

lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = handler.capabilities,
	}

	if server.name == "tsserver" then
		opts.tbl_deep_extend("force", tsserver.opts, opts)
	end

	if server.name == "sumneko_lua" then
		opts = vim.tbl_deep_extend("force", sumneko.opts, opts)
	end

	if server.name == "jsonls" then
		opts = vim.tbl_deep_extend("force", jsonls.opts, opts)
	end

	server:setup(opts)
end)
