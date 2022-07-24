---@diagnostic disable: redundant-parameter
local cmp = require("cmp")
local snippet = require('luasnip')
local M = {}

-- Make sure to have codicons font installed for icons to be shown
local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

M.setup = function()
	cmp.setup({
		completion = {
			-- selects the first value of the completion menu automatically
			completeopt = 'menu,menuone,noinsert'
		},

		snippet = {
			expand = function(args)
				snippet.lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			---@diagnostic disable-next-line: missing-parameter
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),

		-- This determines the order in which the completion is show
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "luasnip" },
		},

		window = {
			documentation = true,
		},

		experimental = {
			ghost_text = true
		},

		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s", cmp_kinds[vim_item.kind])

				-- sources
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[LaTeX]",
				})[entry.source.name]
				return vim_item
			end,
		},
	})
end

return M
