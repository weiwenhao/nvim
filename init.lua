-- nvim-tree 要求禁用 vim 自带的 netrw 插件
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('options')
require('keymaps')
require('lsp')
