local default_config_dir = vim.fn.stdpath("config") .. "/lua/plugins/linting/configs/"

-- we need to wrap to_register to a function, since null-ls will loaded after
-- See https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- for a list of available built-in sources
return {
    pylint = {
        name = "pylint", -- for mason installer
        to_register_wrap = function()
            return require("null-ls").register(require("null-ls").builtins.diagnostics.pylint.with({
                filetypes = { "python" },
                extra_args = {
                    "--rcfile",
                    require("util").config_finder({ ".pylintrc", "pylintrc" }, default_config_dir),
                },
            }))
        end,
    },
    eslint = {
        name = "eslint_d",
        to_register_wrap = function()
            return require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with({
                -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
                -- extra_args = {
                --     "--config",
                --     require("util").config_finder({
                --         ".eslintrc.js",
                --         ".eslilntrc.cjs",
                --         ".eslintrc.yml",
                --         ".eslintrc.json",
                --         ".eslintrc.yaml",
                --         ".eslint.config.js",
                --     }, default_config_dir),
                -- },
            }))
        end,
    },
    shellcheck = {
        name = "shellcheck",
        to_register_wrap = function()
            return require("null-ls").register(require("null-ls").builtins.diagnostics.shellcheck.with({
                filetypes = { "sh", "zsh" },
            }))
        end,
    },
}
