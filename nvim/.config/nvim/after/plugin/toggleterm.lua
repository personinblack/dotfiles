require("toggleterm").setup({
    direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    float_opts = { border = "curved" },
})

vim.keymap.set("n", "<Leader>g", function() lazygit:toggle() end,
    { noremap = true, silent = true })
