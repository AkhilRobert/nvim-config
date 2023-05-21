local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node   -- static text
local i = ls.insert_node -- text that can be inserted

ls.add_snippets("go", {
  s({ trig = "main", dscr = "Main method with package `main`" }, {
    t("package main"),
    t({ "", "" }) --[[ line break ]],
    t({ "", "" }) --[[ line break ]],
    t("func main() {"),
    t({ "", "" }),
    i(0),
    t("}")
  })
})
