-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"


        -- UI Stuff
    -- Colors
    use "savq/melange"
    -- Incremental syntax parsing
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install")
                .update({ with_sync = true })
            ts_update()
        end,
    }
    -- Zen mode with dim
    use "folke/zen-mode.nvim"
    use "folke/twilight.nvim"
    -- Git signs
    use "lewis6991/gitsigns.nvim"
    -- Indent guides
    use "lukas-reineke/indent-blankline.nvim"


        -- Usability Stuff
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim",
            "natecraddock/telescope-zf-native.nvim" -- Search with file names prioritized
        },
    }
    -- Undo tree like nerdtree
    use "mbbill/undotree"
    -- Comments
    use "numToStr/Comment.nvim"
    -- Surroundings
    use "tpope/vim-surround"
    -- Current project root
    use "airblade/vim-rooter"
    -- Editorconfig
    use "editorconfig/editorconfig-vim"
    -- Vim Tmux integration
    use "christoomey/vim-tmux-navigator"
    -- File manager
    use "nvim-tree/nvim-tree.lua"
    -- Auto close delimiters
    use "raimondi/delimitmate"
    -- Tab out of delimiters
    use {
        "abecodes/tabout.nvim",
        requires = "nvim-treesitter",
        after = "nvim-cmp"
    }
    -- Floating terminals for lazygit and similar
    use { "akinsho/toggleterm.nvim", tag = "2.3.0" }


        -- LSP
    -- LSP Zero
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
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
        }
    }
end)
