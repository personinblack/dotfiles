local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>s", builtin.find_files, {})
vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
vim.keymap.set("n", "<leader>sa", builtin.live_grep, {})
vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ss", builtin.lsp_workspace_symbols, {})

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        preview = {
            treesitter = false,
        },
        file_ignore_patterns = {
            "^.git/"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(_)
                return {"--hidden"}
            end,
        },
    },
}

require("telescope").load_extension("zf-native")
