local lsp_installer = require("nvim-lsp-installer")
local vim = vim

-- This installs the lsp
lsp_installer.on_server_ready(function(server)
		local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local opts = {}

		opts.capabilities = capabilities

		if server.name=="sumneko_lua" then
			opts.settings = {
				Lua = {
					telementry = {
						enabel = false,
					},
					diagnostics = {
						globals = {'vim'}
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			}
		end


		-- Disables tsserver formatting
		if server.name == "tsserver" then
			opts.on_attach = function (client)
				client.resolved_capabilities.document_formatting = false
			end
		end


    server:setup(opts)
end)


