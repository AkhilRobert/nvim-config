require("settings")

require("packer-setup")
require("plugins")
require("keymappings")

require('indent_blankline').setup({
	char = "▏",
	show_trailing_blankline_indent = false,
	use_treesitter = true,
	show_current_context = true,
})

require("nvim-lsp-installer").setup {}
require("lsp")
require("colorscheme")
require('snippets').setup()
