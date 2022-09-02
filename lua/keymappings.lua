---@diagnostic disable: redundant-parameter
local utils = require('utils')


utils.map("n", "<C-n>", ":nohl<CR>")

-- LSP
local lsp_buf = vim.lsp.buf;
utils.map("n", "gd", lsp_buf.definition)
utils.map("n", "gi", lsp_buf.references)
utils.map("n", "K", "<cmd> Lspsaga hover_doc<CR>")
utils.map("n", "<leader>ln", "<cmd>Lspsaga rename<CR>")
utils.map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")
utils.map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>")
utils.map("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>")
utils.map("n", "ss", "<cmd>vsplit<CR>")
utils.map("n", "sS", "<cmd>split<CR>")

-- Telescope
utils.map("n", "ff", "<cmd>Telescope find_files<CR>")
utils.map("n", "fg", "<cmd>Telescope live_grep<CR>")
utils.map("n", "fb", "<cmd>Telescope buffers<CR>")
utils.map("n", "fd", "<cmd>Telescope diagnostics<CR>")

-- Neotree
utils.map("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>")
