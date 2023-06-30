require("toggleterm").setup({
    direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    float_opts = { border = "curved" },
})
local fish = Terminal:new({
    cmd = "fish",
    float_opts = { border = "curved" },
})

vim.keymap.set("n", "<Leader>g", function() lazygit:toggle() end,
    { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>t", function() fish:toggle() end,
    { noremap = true, silent = true })
