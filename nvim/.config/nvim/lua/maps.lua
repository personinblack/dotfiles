local function mset(mode, lhs, rhs, remap)
    vim.keymap.set(mode, lhs, rhs, { remap = remap or false })
end

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
-- New tab shortcut
mset("n", "gn", "<Cmd>tabnew<CR>")
-- Fast previous buffer
mset("n", "<Leader><Leader>", "<c-^>")
-- <C-n> out of insert mode in :terminal
mset("t", "<C-n>", "<C-\\><C-n>")

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
mset("", "ç", ">", true)
mset("", "ö", "<", true)
mset("", "ğ", "[", true)
mset("", "ü", "]", true)
mset("", "Ğ", "{", true)
mset("", "Ü", "}", true)
