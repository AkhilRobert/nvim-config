local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local M = {}

M.setup = function()
	require("nvim-autopairs").setup({})
	require("nvim-ts-autotag").setup()

	-- Adds () after a function call
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
