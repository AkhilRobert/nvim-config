local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

key_mapper("n", "<C-n>", ":nohl<CR>")

-- LSP
key_mapper("n", "K", ":lua vim.lsp.buf.hover()<CR>")
key_mapper("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
key_mapper("n", "gi", ":lua vim.lsp.buf.references()<CR>")
key_mapper("n", "<leader>ln", "<cmd> Lspsaga rename<CR>")
key_mapper("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")
key_mapper("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>")
key_mapper("n", "<C-v>", "<cmd>vsplit<CR>")
key_mapper("n", "<C-s>", "<cmd>split<CR>")

-- Telescope
key_mapper("n", "<leader>ff", ':lua require("telescope.builtin").find_files()<CR>')
key_mapper("n", "<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')
key_mapper("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')


-- NvimTree
key_mapper("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>")

-- Typescript
key_mapper("n", "<leader>ti", ":TypescriptAddMissingImports<CR>")
