require("settings")

require("packer-setup")
require("plugins")
require("keymappings")

require("nvim-lsp-installer").setup {
	ensure_installed = {
		"sumneko_lua",
		"tsserver",
		"prismals",
		"pyright",
		"gopls",
		"rust_analyzer"
	},
	automatic_installation = true
}
require("lsp")
require("colorscheme")
