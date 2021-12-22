local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.termguicolors = true
o.syntax = "on"
bo.smartindent = true
bo.autoindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
wo.number = true
wo.relativenumber = true
o.splitright = true
o.scrolloff = 10
o.sidescrolloff = 5

vim.g.mapleader = ","

-- barbar
vim.g.bufferline = {
	icon_separator_active = "",
	icon_separator_inactive = "",
	maximum_padding = 2,
	closable = false,
}
