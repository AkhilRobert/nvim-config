local map = function(mode, key, result)
	vim.keymap.set(mode, key, result, { noremap = true, silent = true })
end

map("n", "<C-n>", ":nohl<CR>")

-- LSP
local lsp_buf = vim.lsp.buf;
map("n", "gd", lsp_buf.definition)
map("n", "gi", lsp_buf.references)
map("n", "K", "<cmd> Lspsaga hover_doc <CR>")
map("n", "<leader>ln", "<cmd>Lspsaga rename <CR>")
map("n", "<leader>la", "<cmd>Lspsaga code_action <CR>")
map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics <CR>")
map("n", "ss", "<cmd>vsplit<CR>")
map("n", "sS", "<cmd>split<CR>")

-- Telescope
map("n", "ff", require("telescope.builtin").find_files)
map("n", "fg", ':lua require("telescope.builtin").live_grep()<CR>')
map("n", "fb", ':lua require("telescope.builtin").buffers()<CR>')
map("n", "fd", ':lua require("telescope.builtin").diagnostics()<CR>')


-- Neotree
map("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>")


-- Typescript
local ok, typescript = pcall(require, 'typescript')
if ok then
	map("n", "<leader>ti", ":TypescriptAddMissingImports<CR>")
	map("n", "<leader>to", function()
		typescript.actions.organizeImports()
		typescript.actions.removeUnused()
	end)
end
