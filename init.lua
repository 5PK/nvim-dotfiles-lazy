
vim.o.termguicolors = true

-- ~/.config/nvim/init.lua or init.lua equivalent
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.relativenumber = true
vim.opt.number = true

-- Leader key
vim.g.mapleader = " "  -- Set leader to spacebar

-- Tab and indent settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim/bin/python3")


require("lazy").setup("plugins")

-- init.lua
require('settings')
require('keymaps')
require('lsp')




