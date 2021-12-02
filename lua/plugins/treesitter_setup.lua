require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "html", "typescript", "javascript", "tsx"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
	rainbow = {
		enable = true,
		disable={"html"},
		extended_mode = true,
		colors = {"#EA66DC", "#FFD300", "#00A0FF"},
	}
}

