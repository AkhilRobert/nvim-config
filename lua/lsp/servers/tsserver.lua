local typescript = require('typescript')
local handler = require('lsp.handlers')
local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node -- static text
local i = ls.insert_node -- text that can be inserted

local M = {}

M.snippets = function()
	local table = {
		s("log", {
			t("console.log("), i(1, "log"), t(");")
		})
	}

	return table
end

-- Creates autocmd
M.setup = function()
	typescript.setup({
		server = {
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
			end,
			capabilities = handler.capabilities
		}
	})
end

return M
