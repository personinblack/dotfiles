local textwidth = function()
    return vim.api.nvim_buf_get_option(0, "textwidth") + 7
end

require("zen-mode").setup({
    window = {
        backdrop = .8,
        width = textwidth,
    },
    plugins = {
        tmux = { enabled = true },
    },
})

require("twilight").setup({
    dimming = {
        alpha = 0.5,
        inactive = true,
    },
    context = 20,
})

vim.keymap.set("n", "<Leader>zz", "<Cmd>ZenMode<CR>")
vim.keymap.set("n", "<Leader>z", "<Cmd>Twilight<CR>")
