local set = vim.o

-- 行号
-- set.relativenumber = true
set.number = true

-- 剪切板共享
set.clipboard = "unnamed"

--缩进
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true
set.wrap = false
set.cursorline = true

-- 外观


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

-- lazy 插件安装
require("lazy").setup({
	{ 'RRethy/nvim-base16', lazy = true},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
})

-- colorscheme 主题配置
require('base16-colorscheme').setup({
     base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
     base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
     base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
     base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
})

-- telescope 全局检索与缓冲区插件
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

