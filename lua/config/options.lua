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
opt.confirm = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Visual
opt.hlsearch = true
opt.list = false
opt.termguicolors = true
opt.clipboard:append("unnamedplus")

-- Split Behavior
opt.splitbelow = true
opt.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Useful Functions
-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})
