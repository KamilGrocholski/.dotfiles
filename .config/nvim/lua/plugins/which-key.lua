require("which-key").setup({
    plugins = {
        presets = {
            g = false,
        },
    },
    window = {
        border = "single",
    },
})

vim.o.timeout = true
vim.timeoutlen = 300
