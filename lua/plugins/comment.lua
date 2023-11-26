return {
  'numToStr/Comment.nvim',
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  event = "VeryLazy",
  config = function()
    require('Comment').setup({
      hooks = {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      },
    })

    local ft = require("Comment.ft")
    ft.set('prisma', '//%s')
  end
}
