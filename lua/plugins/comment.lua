return {
  'numToStr/Comment.nvim',
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  event = "BufReadPost",
  config = function()
 require('Comment').setup({
    hooks = {
      pre = function()
        ---@diagnostic disable-next-line: missing-parameter
        require('ts_context_commentstring.internal').update_commentstring()
      end,
    },
  })

  local ft = require("Comment.ft")
  ft.set('prisma', '//%s')
  end
}
