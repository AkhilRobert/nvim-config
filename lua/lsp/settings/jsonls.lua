local M = {}

local schemas = {
	{
		description = "NPM configuration file",
		fileMatch = { "package.json" },
		url = "https://json.schemastore.org/package.json",
	},
}

local on_attach = function(client)
	client.resolved_capabilities.document_formatting = false
end

M.opts = {
	on_attach = on_attach,
	settings = {
		json = {
			schemas = schemas,
		},
	},
}

return M
