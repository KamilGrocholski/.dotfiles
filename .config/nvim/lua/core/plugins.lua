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

vim.g.mapleader = " "

require("lazy").setup({
    { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },
    -- { "kdheepak/monochrome.nvim", lazy = false, priority = 1000 },
    -- { "AlexvZyl/nordic.nvim", lazy = false, priority = 1000 },

    {
        "barrett-ruth/live-server.nvim",
        build = "npm i -g live-server",
        config = true,
    },

    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",

    "folke/twilight.nvim",
    { "folke/zen-mode.nvim" },

    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    { "lewis6991/gitsigns.nvim", event = "BufEnter" },
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "NvChad/nvim-colorizer.lua",
    { "stevearc/dressing.nvim", event = "BufEnter" },

    "ThePrimeagen/vim-be-good",
    "ThePrimeagen/harpoon",
    "nvim-lua/plenary.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
    },

    "nvim-treesitter/nvim-treesitter-context",

    "windwp/nvim-autopairs",

    "folke/which-key.nvim",

    "nmac427/guess-indent.nvim",

    "jose-elias-alvarez/null-ls.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
    },

    "williamboman/mason-lspconfig.nvim",

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                lazy = true,
                build = "make",
            },
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                lazy = true,
            },
            {
                "ThePrimeagen/harpoon",
                lazy = true,
            },
            {
                "debugloop/telescope-undo.nvim",
                lazy = true,
            },
            {
                "nvim-telescope/telescope-file-browser.nvim",
                lazy = true,
            },
        },
    },
})
