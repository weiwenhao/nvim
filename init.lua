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
