-- 行号
-- set.relativenumber = true
vim.opt.number = true

-- 剪切板共享
vim.opt.clipboard = "unnamed"

-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

-- insert 模式下光标是一个竖线
vim.opt.cursorline = true

-- 搜索相关配置
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- 高清色彩(非必要也可以在终端 gui 中启用)
vim.opt.termguicolors = true

-- 新开窗口默认在下方和右侧
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right


-- 更好的自动补全配置
-- --Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match 即使只有一个提示项也弹出窗口
-- noinsert: Do not insert text until a selection is made 不自动插入文本
-- noselect: Do not select, force to select one from the menu 不自动选择
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.opt.updatetime = 100

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
   vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = diag_float_grp,
})


-- 保存时自动执行 go format 
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})



