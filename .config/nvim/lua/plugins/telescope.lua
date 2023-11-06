local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
            return
        end
        if stat.size > 100000 then
            return
        else
            require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

-- configs
local enable_previewer = false

local function edit_neovim()
    local opts = {
        prompt_title = "~ Neovim Config ~",
        cwd = vim.fn.stdpath("config"),
        previewer = enable_previewer,
    }

    require("telescope.builtin").find_files(opts)
end

local function find_files_or_git_files()
    if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
        local opts = {
            -- previewer = enable_previewer,
            show_untracked = true,
        }

        require("telescope.builtin").git_files(opts)
    else
        local opts = {
            -- previewer = enable_previewer,
            no_ignore = true, -- set false to ignore files by .gitignore
            hidden = true, -- set false to ignore dotfiles
        }

        require("telescope.builtin").find_files(opts)
    end
end

local function find_files()
    local opts = {
        previewer = enable_previewer,
        no_ignore = true, -- set false to ignore files by .gitignore
        hidden = false, -- set false to ignore dotfiles
    }

    require("telescope.builtin").find_files(opts)
end

local function live_grep()
    -- require('telescope.builtin').live_grep()
    require("telescope").extensions.live_grep_args.live_grep_args()
end

local function file_browser()
    require("telescope").extensions.file_browser.file_browser({})
end

local function current_buffer_fuzzy_find()
    -- require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    --     previewer = false,
    -- }))
    require("telescope.builtin").current_buffer_fuzzy_find()
end

local function lsp_definitions()
    require("telescope.builtin").lsp_definitions(require("telescope.themes").get_dropdown({
        show_line = false,
    }))
end

local function lsp_references()
    require("telescope.builtin").lsp_references(require("telescope.themes").get_dropdown({
        show_line = false,
    }))
end

local function lsp_implementations()
    require("telescope.builtin").lsp_implementations(require("telescope.themes").get_dropdown({
        show_line = false,
    }))
end

require("telescope").setup({
    defaults = {
        buffer_previewer_maker = new_maker,
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close,
                ["<c-j>"] = require("telescope.actions").move_selection_next,
                ["<c-k>"] = require("telescope.actions").move_selection_previous,
                ["<c-s>"] = require("telescope.actions").select_vertical,
                ["<c-h>"] = { "<c-s-w>", type = "command" }, -- using Ctrl+Backspace delete a word
                ["<c-bs>"] = { "<c-s-w>", type = "command" }, -- using Ctrl+Backspace delete a word
                ["<C-u>"] = require("telescope.actions").results_scrolling_up,
                ["<C-d>"] = require("telescope.actions").results_scrolling_down,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            previewer = false,
            theme = "dropdown",
            hijack_netrw = true,
            initial_mode = "normal",
            git_status = false,
            mappings = {
                i = {
                    ["<esc>"] = false,
                },
            },
        },
        undo = {
            mappings = {
                i = {
                    -- ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    -- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    -- ["<C-cr>"] = require("telescope-undo.actions").restore,
                    ["<cr>"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
})

require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", find_files_or_git_files)
vim.keymap.set("n", "<leader>ff", find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>/", current_buffer_fuzzy_find, { desc = "Current buffer fuzzy find" })
vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "Diagnostics windows" })
vim.keymap.set("n", "<C-f>", live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "gd", lsp_definitions)
vim.keymap.set("n", "gr", lsp_references)
vim.keymap.set("n", "gi", lsp_implementations)
vim.keymap.set("n", "<leader>fn", edit_neovim, { desc = "Edit neovim" })
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undo tree" })
