local util = require('lua.utils')


util.map("n", "<C-n>", ":nohl<CR>")

-- LSP
local lsp_buf = vim.lsp.buf;
util.map("n", "gd", lsp_buf.definition)
util.map("n", "gi", lsp_buf.references)
util.map("n", "K", "<cmd> Lspsaga hover_doc<CR>")
util.map("n", "<leader>ln", "<cmd>Lspsaga rename<CR>")
util.map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")
util.map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>")
util.map("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>")
util.map("n", "ss", "<cmd>vsplit<CR>")
util.map("n", "sS", "<cmd>split<CR>")

-- Telescope
util.map("n", "ff", "<cmd>Telescope find_files<CR>")
util.map("n", "fg", "<cmd>Telescope live_grep<CR>")
util.map("n", "fb", "<cmd>Telescope buffers<CR>")
util.map("n", "fd", "<cmd>Telescope diagnostics<CR>")

-- Neotree
util.map("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>")
