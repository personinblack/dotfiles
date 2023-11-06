local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        -- UI Stuff
    -- Colors
    "savq/melange",
    -- Incremental syntax parsing
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    -- Zen mode with dim
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",
    -- Git signs
    "lewis6991/gitsigns.nvim",
    -- Indent guides
    "lukas-reineke/indent-blankline.nvim",
    -- Markdown preview
    "ellisonleao/glow.nvim",


        -- Usability Stuff
    -- Telescope
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "natecraddock/telescope-zf-native.nvim" -- Search with file names prioritized
        },
    },
    -- Undo tree like nerdtree
    "mbbill/undotree",
    -- Comments
    "numToStr/Comment.nvim",
    -- Surroundings
    "tpope/vim-surround",
    -- Current project root
    "airblade/vim-rooter",
    -- Editorconfig
    "editorconfig/editorconfig-vim",
    -- Vim Tmux integration
    "christoomey/vim-tmux-navigator",
    -- File manager
    "nvim-tree/nvim-tree.lua",
    -- Auto close delimiters
    "raimondi/delimitmate",
    -- Tab out of delimiters
    {
        "abecodes/tabout.nvim",
        dependencies = { "nvim-treesitter" },
    },
    -- Floating terminals for lazygit and similar
    { "akinsho/toggleterm.nvim", tag = "2.3.0" },
    -- Save as ROOT
    "https://github.com/lambdalisue/suda.vim",


        -- LSP
    -- LSP Zero
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
                -- LSP Support
            -- Official LSP configurations
            "neovim/nvim-lspconfig",
            -- LSP installer gui
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- Lua Neovim API integration
            "folke/neodev.nvim",

                -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

                -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",

                -- Formatting / Linting
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
        }
    },

        -- Others
    -- VimWiki
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/projects/wiki/",
                    syntax = "markdown", ext = ".md"
                },
            }
            vim.g.vimwiki_key_mappings = {
                headers = 0
            }
            vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
                pattern = {"*.md"},
                callback = function()
                    vim.opt_local.autowrite = true
                    vim.opt_local.autowriteall = true
                    vim.opt_local.autoread = true
                end
            })
            vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged", "TextChangedI"}, {
                pattern = {"*.md"},
                command = ":w"
            })
        end
    },
})
