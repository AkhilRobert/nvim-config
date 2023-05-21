local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node   -- static text
local i = ls.insert_node -- text that can be inserted

ls.add_snippets("typescript", {
  s("log", {
    t("console.log("), i(1, "log"), t(");")
  })
})

ls.filetype_extend("javascript", { "typescript" })
ls.filetype_extend("typescriptreact", { "typescript" })
