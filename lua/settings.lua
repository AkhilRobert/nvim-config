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

vim.g.mapleader = ","
