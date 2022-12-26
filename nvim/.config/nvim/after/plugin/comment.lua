require("Comment").setup({
    padding = true,
    sticky = true,
    toggler = { line = "<Leader>c", block = "<Leader>b" },
    opleader = { line = "gc", block = "gb" },
    extra = { above = "gca", below = "gcb", eol = "gc$" },
    mappings = { basic = true, extra = true },
    ignore = nil,
    pre_hook = nil,
    post_hook = nil,
})
