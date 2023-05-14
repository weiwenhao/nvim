-- leader config space
vim.g.mapleader = " "

-- 窗口移动操作
local opt = { noremap = true, silent = true}
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)

-- telescope 全局检索与缓冲区插件
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- leader 相关
vim.keymap.set('n', '<leader>q', ':q<CR>', opt)
vim.keymap.set('n', '<leader>w', ':w<CR>', opt)
vim.keymap.set('n', '<leader>r', ':!cargo run<CR>', opt) -- TODO 如何根据当前的文件判断是 go run 还是 cargo run


-- 目录操作键映射
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opt)


