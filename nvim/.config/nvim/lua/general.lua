local vopt = vim.opt
local group = vim.api.nvim_create_augroup("menfie.general", {})

    -- VISUAL STUFF
-- Max length for syntax highlighting
vopt.synmaxcol = 180
-- Relative line numbers
vopt.nu = true
vopt.rnu = true
-- Visual line limit
vopt.colorcolumn = "+0"
-- Highlight cursor line
vopt.cursorline = true
-- Highlight matching brackets/parenthesis
vopt.showmatch = true
-- Show invisible characters
vopt.list = true
vopt.listchars:append("tab:  ")
vopt.listchars:append("trail:·")
vopt.listchars:append("extends:»")
vopt.listchars:append("precedes:«")
vopt.listchars:append("nbsp:░")
-- More space for cmd messages
-- vopt.cmdheight = 2
-- Make some space around cursor
vopt.scrolloff = 10
-- Hide search results
vopt.hlsearch = false
-- Status line
vopt.statusline = "%<%f %m%=%-7.(%c%)  %P"


    -- CODE STYLE
-- Default tab sizes
vopt.tabstop = 4
vopt.softtabstop = 4
vopt.shiftwidth = 0
-- Tabs to spaces by default
vopt.expandtab = true
-- Max line length indicator
vopt.textwidth = 90


    -- IMPROVEMENTS
-- Keep undo history
vopt.undofile = true
vopt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
vopt.swapfile = false
vopt.backup = false
-- Case insensitive search
vopt.ignorecase = true
vopt.smartcase = true
-- Natural split behavior
vopt.splitbelow = true
vopt.splitright = true
-- Update faster
vopt.updatetime = 50
-- Wait shorter for additional keypresses
vopt.timeoutlen = 500
-- Auto remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
