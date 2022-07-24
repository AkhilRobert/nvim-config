local key_mapper = function(mode, key, result)
	vim.keymap.set(mode, key, result, { noremap = true, silent = true })
end

key_mapper("n", "<C-n>", ":nohl<CR>")

-- LSP
key_mapper("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
key_mapper("n", "gi", ":lua vim.lsp.buf.references()<CR>")
key_mapper("n", "K", require('lspsaga.hover').render_hover_doc)
key_mapper("n", "<leader>ln", require('lspsaga.rename').lsp_rename)
key_mapper("n", "<leader>la", require('lspsaga.codeaction').code_action)
key_mapper("n", "<leader>ld", require('lspsaga.diagnostic').show_line_diagnostics)
key_mapper("n", "<leader>s", "<cmd>vsplit<CR>")
key_mapper("n", "<leader>S", "<cmd>split<CR>")

-- Telescope
key_mapper("n", "<leader>ff", require("telescope.builtin").find_files)
key_mapper("n", "<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')
key_mapper("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')
key_mapper("n", "<leader>fd", ':lua require("telescope.builtin").diagnostics()<CR>')


-- NvimTree
key_mapper("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>")

-- Typescript
key_mapper("n", "<leader>ti", ":TypescriptAddMissingImports<CR>")
key_mapper("n", "<leader>to", ":TypescriptOrganizeImports<CR>")
