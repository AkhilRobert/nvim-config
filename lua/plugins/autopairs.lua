local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup()

-- Adds () after a function call
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
