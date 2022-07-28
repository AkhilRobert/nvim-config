local lsp = require('lspconfig')
local handler = require('lsp.handlers')
local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node -- static text
local i = ls.insert_node -- text that can be inserted

local M = {}

M.snippets = function()
	local table = {
		-- Main
		s({ trig = "main", dscr = "Main method with package `main`" }, {
			t("package main"),
			t({ "", "" }) --[[ line break ]] ,
			t({ "", "" }) --[[ line break ]] ,
			t("func main() {"),
			t({ "", "" }),
			i(0),
			t("}")
		})
	}

	return table
end

M.setup = function()
	lsp.gopls.setup {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end,
		capabilities = handler.capabilities
	}
end

return M
