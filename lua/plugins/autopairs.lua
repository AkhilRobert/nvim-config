local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local autotag = require('nvim-autopairs')
local ts_autotag = require('nvim-ts-autotag')
local cmp = require("cmp")

local M = {}

M.setup = function()
  autotag.setup()

  ts_autotag.setup {
    enable = true
  }

  cmp.event:on("confirm_done",
    cmp_autopairs.on_confirm_done({
      filetypes = {
        -- Disables for prisma files
        prisma = false
      }
    })
  )
end


return M
