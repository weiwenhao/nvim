-- lazy.nvim install
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


-- lazy 相关插件安装，优先使用 lazy 保证加载速度
require("lazy").setup({
    { 'RRethy/nvim-base16', lazy = true},
    { 
        'nvim-tree/nvim-tree.lua', 
        lazy = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
    },
    {
        "simrat39/rust-tools.nvim",
    },
    { "nvim-treesitter/nvim-treesitter" },
    { 
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
        },
        event = {"CmdlineEnter"},
        ft = {'go', 'gomod'},
    },
    { 
        "windwp/nvim-autopairs",
         config = function() 
             require("nvim-autopairs").setup({})
         end

    },
    -- 自动补全插件
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
})

-- colorscheme 主题插件配置
require('base16-colorscheme').setup({
    base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
    base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
    base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
    base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
})

-- nvim tree 启用及配置
require("nvim-tree").setup({
    renderer = {
        group_empty = true,
    },
    git = {
        enable = false
    }
})


-- mason lsp 集成配置，使用 :Mason 前缀可以查看 mason 命令， mason 的作用是快速安装 lsp server 端
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})

-- cmp
local cmp = require 'cmp'
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- scroll up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- scroll down
        ['<Tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert, -- Replace or Insert
            select = true,
        })
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
    },
})
