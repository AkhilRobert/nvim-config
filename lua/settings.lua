local o = vim.o
local bo = vim.bo
local wo = vim.wo

local opt = vim.opt -- behaves like :set

o.termguicolors = true
o.syntax = "on"
bo.smartindent = true
bo.autoindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
wo.number = true
wo.relativenumber = true
wo.cursorline = true
o.splitright = true
o.scrolloff = 10
o.sidescrolloff = 5
o.mouse = "a"

vim.g.mapleader = ","
