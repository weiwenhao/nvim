local set = vim.o
set.numebr = true
set.relativenumber = true
set.clipboard = "unnamed"

-- keybindings
local opt = { noremap = true, silent = true}
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)


-- set leader
vim.g.mapleader = " "


-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 'RRethy/nvim-base16', lazy = true},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
})

require('base16-colorscheme').setup({
     base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
     base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
     base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
     base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
})



