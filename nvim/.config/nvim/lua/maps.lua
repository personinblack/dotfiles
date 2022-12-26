local mset = vim.keymap.set

vim.g.mapleader = " "

-- Ctrl-[d/u] center screen
mset("n", "<C-d>", "<C-d>zz")
mset("n", "<C-u>", "<C-u>zz")
-- n/N center screen
mset("n", "n", "nzzzv")
mset("n", "N", "Nzzzv")
-- Switch current line
mset("v", "J", ":m '>+1<CR>gv=gv")
mset("v", "K", ":m '<-2<CR>gv=gv")

-- New pane shortcuts
mset("n", "-", "<Cmd>new<CR>")
mset("n", ",", "<Cmd>vnew<CR>")
-- Fast previous buffer
mset("n", "<Leader><Leader>", "<c-^>")
-- <Esc> out of insert mode in :terminal
mset("t", "<Esc>", "<C-\\><C-n>")

-- Copy into clipboard
mset({ "n", "v" }, "<leader>y", [["+y]])
mset("n", "<leader>Y", [["+Y]])

-- Pardon my language
vim.opt.langmap = {
    "ç>",
    "ö<",
    "ğ[",
    "ü]",
    "Ğ{",
    "Ü}",
}
