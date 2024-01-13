local utils = require('utils')


utils.map("n", "<C-h>", ":nohl<CR>")

-- LSP
local lsp_buf = vim.lsp.buf;
utils.map("n", "gd", lsp_buf.definition)
utils.map("n", "gi", lsp_buf.references)

utils.map("n", "ss", "<cmd>vsplit<CR>")
utils.map("n", "sS", "<cmd>split<CR>")
