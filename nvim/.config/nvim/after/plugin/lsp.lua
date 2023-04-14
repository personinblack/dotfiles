local lsp = require("lsp-zero")

-- Setup neodev before others
require("neodev").setup()

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-o>"] = cmp.mapping.confirm({ select = true }),
    ["<S-Tab>"] = cmp.mapping.complete({}),
})

-- disable completion with tab
cmp_mappings["<Tab>"] = nil
cmp_mappings["<CR>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    -- Format command
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true
        })
        if client.server_capabilities.documentFormattingProvider then
            vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end
    end, { range = false, desc = "Format with LSP" })

    if client.server_capabilities.documentRangeFormattingProvider then
        vim.api.nvim_buf_set_option(bufnr, "formatexpr",
            "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
        vim.api.nvim_buf_create_user_command(bufnr, "RangeFormat",
            function(args)
                vim.lsp.buf.format({
                    bufnr = bufnr,
                    async = false,
                    range = { start = { args.line1, 0 },
                        ["end"] = { args.line2, 0 } },
                })
            end, { range = true, desc = "Format with LSP" })
    end
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

require("mason-null-ls").setup({
    automatic_installation = false,
    automatic_setup = true,
})

require("null-ls").setup()
require("mason-null-ls").setup_handlers()
