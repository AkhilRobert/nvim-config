---@diagnostic disable: redundant-parameter
local cmp = require("cmp")
local snippet = require("luasnip")
local lspkind = require("lspkind")
local M = {}

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
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
		},

		window = {
			documentation = true,
		},

		experimental = {
			ghost_text = true
		},

		formatting = {
			format = lspkind.cmp_format({
				mode = 'symbol',
				preset = 'codicons',
				maxwidth = 50,
			})
		},
	})
end

return M
