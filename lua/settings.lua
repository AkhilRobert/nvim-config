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
opt.expandtab = true
wo.number = true
wo.relativenumber = true
wo.cursorline = true
o.splitright = true
o.scrolloff = 10
o.sidescrolloff = 5
o.mouse = "a"
o.signcolumn = "yes"

-- Spelling
-- opt.spell = true
-- opt.spelllang = { 'en_us' }

vim.g.mapleader = ","

-- Highlight text on yank
local yank_highlight = vim.api.nvim_create_augroup('yank_highlight', { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  command = "lua vim.highlight.on_yank()",
  group = yank_highlight
})
