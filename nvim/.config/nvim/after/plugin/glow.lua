require("glow").setup({
    glow_path = vim.fn.exepath("glow"),
    install_path = vim.env.HOME .. "/.local/bin",
    border = "shadow",
    style = "light",
    mouse = false,
    pager = false,
    width_ratio = 0.5,
    height_ratio = 0.8,
})
