-- nvim-tree 要求禁用 vim 自带的 netrw 插件
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 自定义文件类型
vim.filetype.add({
  extension = {
    n = 'nature',
  },
})

require('plugins')
require('options')
require('keymaps')
require('lsp')
