local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

key_mapper("n", "<C-n>", ":nohl<CR>")

-- LSP
key_mapper("n", "K", ":lua vim.lsp.buf.hover()<CR>")
key_mapper("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
key_mapper("n", "gi", ":lua vim.lsp.buf.references()<CR>")
key_mapper("n", "<leader>ln", ":lua vim.lsp.buf.rename()<CR>")
key_mapper("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>")

-- Telescope
key_mapper(
	"n",
	"<leader>ff",
	":lua require(\"telescope.builtin\").find_files(require('telescope.themes').get_dropdown())<CR>"
)
key_mapper("n", "<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')
key_mapper("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')

-- Buffer
key_mapper("n", "<leader>bc", ":BufferClose<CR>")
key_mapper("n", "<leader>bn", ":bnext<CR>")
key_mapper("n", "<leader>bp", ":bprevious<CR>")

-- NvimTree
key_mapper("n", "<leader>e", ":NvimTreeToggle<CR>")
