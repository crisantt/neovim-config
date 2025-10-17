local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.tabstop = 2
opt.autoindent = true
opt.shiftwidth = 2
opt.smartindent = true
opt.wrap = false
opt.list = false
opt.ignorecase = true
opt.hlsearch = false 
opt.termguicolors = true
opt.clipboard:append("unnamedplus")

-- Split Behavior
opt.splitbelow = true
opt.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "
