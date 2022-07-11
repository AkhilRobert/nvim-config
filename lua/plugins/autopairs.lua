local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local M = {}

M.setup = function()
	require("nvim-autopairs").setup({})
	require("nvim-ts-autotag").setup()

	-- Adds () after a function call
	cmp.event:on("confirm_done",
		function()
			local file = vim.bo.filetype
			-- Ignores adding brackets completion in prisma as it is handled by the LSP
			if (file ~= "prisma") then
				cmp_autopairs.on_confirm_done()
			end
		end
	)
end

return M
