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
opt.expandtab = true -- Fixes github indentation issue
wo.number = true
wo.relativenumber = true
wo.cursorline = true
o.splitright = true
o.scrolloff = 10
o.sidescrolloff = 5
o.mouse = "a" -- enables mouse in all modes
o.signcolumn = "yes"

vim.g.mapleader = ","

-- Highlight text on yank
local yank_highlight = vim.api.nvim_create_augroup('yank_highlight', { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  command = "lua vim.highlight.on_yank()",
  group = yank_highlight
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
require("settings")

--require("plugins")
require("keymappings")
--require('indent_blankline').setup({
--  char = "▏",
--  show_trailing_blankline_indent = false,
--  use_treesitter = true,
--  show_current_context = true,
--})


require("colorscheme")
-- require("lsp")
-- require('snippets').setup()

