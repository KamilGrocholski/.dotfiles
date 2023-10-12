require("lualine").setup({
    options = {
        icons_enabled = false,
        globalstatus = true,
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_a = {
            {
                "filename",
                path = 1,
            },
        },
    },
})
