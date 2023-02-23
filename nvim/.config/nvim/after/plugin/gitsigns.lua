local gitsigns = require("gitsigns")
gitsigns.setup {
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    numhl = true,
    diff_opts = {
        algorithm = "myers",
        internal = true,
        indent_heuristic = true,
        vertical = true,
    },
    word_diff = false,
    status_formatter = function(status)
        local added, changed, removed = status.added, status.changed, status.removed
        local status_txt = {}
        if added and added > 0 then table.insert(status_txt, '+' .. added) end
        if changed and changed > 0 then table.insert(status_txt, '~' .. changed) end
        if removed and removed > 0 then table.insert(status_txt, '-' .. removed) end
        return table.concat(status_txt, ' ')
    end,
    on_attach = function(bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gp", gitsigns.preview_hunk, opts)
        vim.keymap.set("n", "[h", gitsigns.prev_hunk, opts)
        vim.keymap.set("n", "]h", gitsigns.next_hunk, opts)
    end
}
