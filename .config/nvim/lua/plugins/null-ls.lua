local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local root_has_file = function(files)
    return function(utils)
        return utils.root_has_file(files)
    end
end

local eslint_root_files = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    "eslint.config.js",
}
local prettier_root_files = {
    ".prettierrc",
    ".prettierrc.js",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    "prettier.config.mjs",
    "prettier.config.cjs",
    ".prettierrc.toml",
    ".prettierrc.cjs",
    ".prettierrc.mjs",
}
local stylua_root_files = { "stylua.toml", ".stylua.toml" }

null_ls.setup({
    sources = {
        -- ts, js...
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
            condition = root_has_file(eslint_root_files),
        }),
        null_ls.builtins.formatting.eslint_d.with({
            condition = root_has_file(eslint_root_files),
        }),
        null_ls.builtins.formatting.prettierd.with({
            condition = root_has_file(prettier_root_files),
        }),
        null_ls.builtins.code_actions.eslint_d.with({
            condition = root_has_file(eslint_root_files),
        }),

        -- lua
        null_ls.builtins.formatting.stylua.with({
            condition = root_has_file(stylua_root_files),
        }),

        -- go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,

        -- c
        null_ls.builtins.formatting.clang_format,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
