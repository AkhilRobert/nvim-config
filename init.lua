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
o.mouse = "a"      -- enables mouse in all modes
o.signcolumn = "yes"
o.swapfile = true  -- enables the swapfile creation
o.updatetime = 300 -- faster updates
o.clipboard = 'unnamed'


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

require('lazy').setup("plugins", {
  dev = {
    path = "~/Programming/plugins/"
  }
})
require("keymappings")
require("colorscheme")
require("lsp")

vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg = "#FFD700" })
vim.api.nvim_set_hl(0, "TSRainbowMagenta", { fg = "#DA70D6" })
vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg = "#159FFF" })
