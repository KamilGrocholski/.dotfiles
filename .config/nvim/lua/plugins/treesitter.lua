require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "bash",
        "regex",
        "c",
        "cpp",
        "go",
        "gomod",
        "java",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "toml",
        "html",
        "css",
        "scss",
        "lua",
        "rust",
        "kdl",
        "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    autotag = { -- dependency with 'nvim-ts-autotag'
        enable = true,
    },
})
