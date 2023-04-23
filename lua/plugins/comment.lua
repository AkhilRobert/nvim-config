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
          require('ts_context_commentstring.internal').update_commentstring()
        end,
      },
    })
  end
}
