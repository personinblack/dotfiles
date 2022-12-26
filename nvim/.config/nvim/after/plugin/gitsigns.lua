require("gitsigns").setup {
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
    word_diff = true,
    status_formatter = function(status)
        local added, changed, removed = status.added, status.changed, status.removed
        local status_txt = {}
        if added and added > 0 then table.insert(status_txt, '+' .. added) end
        if changed and changed > 0 then table.insert(status_txt, '~' .. changed) end
        if removed and removed > 0 then table.insert(status_txt, '-' .. removed) end
        return table.concat(status_txt, ' ')
    end

}
