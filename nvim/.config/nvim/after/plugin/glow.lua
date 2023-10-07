---@diagnostic disable: missing-fields
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
---@diagnostic enable: missing-fields

local buf = -1
local bufwin = -1

local function newglow()
    local filename = vim.api.nvim_buf_get_name(0)
    local getwin = vim.api.nvim_get_current_win
    local win = getwin()
    local recreate = buf == -1 or bufwin == -1
        or not vim.api.nvim_buf_is_loaded(buf)
        or not vim.api.nvim_win_is_valid(bufwin)

    if recreate then
        vim.cmd("vsplit")
    else
        -- if bufwin ~= -1 then
        --     vim.api.nvim_win_close(bufwin, true)
        -- end
        -- if buf ~= -1 then
        --     vim.api.nvim_buf_delete(buf, { force = true })
        -- end

        vim.api.nvim_set_current_win(bufwin)
        --
        -- return newglow()
    end
    -- Hacky solution for detecting the term as an ".md" file cuz of the "%" at the end
    vim.cmd { cmd = 'terminal', args = {
        "PAGER=cat", "glow", "-p", "--style", "light", filename, ";", "sleep", "0.01"
    } }
    buf = vim.api.nvim_get_current_buf()
    if recreate then
        vim.api.nvim_win_set_width(
        getwin(),
        vim.api.nvim_win_get_width(getwin()) - 1
        )
    end
    bufwin = getwin()
    vim.opt_local.scrollbind = true
    vim.api.nvim_set_current_win(win)
    vim.opt_local.scrollbind = true
    vim.cmd("syncbind")
end

vim.api.nvim_create_user_command("NGlow", newglow, {})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.md" },
    command = ":NGlow"
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
    pattern = { "*.md" },
    command = ":NGlow"
})
