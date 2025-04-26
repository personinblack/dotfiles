-- vim:fileencoding=utf-8:foldmethod=marker:softtabstop=4:shiftwidth=4
--
--          NVIM Config
--
-- Author: personinblack
-- GitHub: https://github.com/personinblack/dotfiles
--

---@diagnostic disable: missing-fields
local group = vim.api.nvim_create_augroup("13271327", {})
local function mset(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

--      "' IMPROVEMENTS '" {{{


-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keep undo history
vim.opt.undofile = true
---@diagnostic disable-next-line: assign-type-mismatch
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.swapfile = false
vim.opt.backup = false

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Natural split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Update faster
vim.opt.updatetime = 50

-- Wait shorter for additional keypresses
vim.opt.timeoutlen = 500

-- Auto remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Look for modeline only at the beginning of a file
vim.opt.modelines = 1

-- Disable mouse
vim.opt.mouse = {}

-- }}}

--      "' KEYMAPS '" {{{


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
mset("n", "-", "<Cmd>split<CR>")
mset("n", ",", "<Cmd>vsplit<CR>")

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
mset("", "ç", ">", { remap = true })
mset("", "ö", "<", { remap = true })
mset("", "ğ", "[", { remap = true })
mset("", "ü", "]", { remap = true })
mset("", "Ğ", "{", { remap = true })
mset("", "Ü", "}", { remap = true })

mset("n", "<F10>", ":silent make! run<CR>")
mset("n", "<F9>", ":silent make!<CR>")
mset("n", "<F8>", ":make!<CR>")

-- }}}

--      "' VISUAL STUFF '" {{{


-- Colorscheme
vim.opt.termguicolors = true
vim.cmd("colorscheme c")

-- Max length for syntax highlighting
vim.opt.synmaxcol = 180

-- Relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Visual line limit
vim.opt.colorcolumn = "+0"

-- Show folds at number column
vim.opt.foldcolumn = "2"

-- Highlight cursor line
vim.opt.cursorline = true

-- Highlight matching brackets/parenthesis
vim.opt.showmatch = true

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars:append("tab:  ")
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("extends:»")
vim.opt.listchars:append("precedes:«")
vim.opt.listchars:append("nbsp:░")

-- Make some space around cursor
vim.opt.scrolloff = 10

-- Hide search results
vim.opt.hlsearch = false

-- Statusline
vim.opt.statusline = " %<"
.. "%f"
.. "%0( :: %{get(b:, 'gitsigns_status', '')}%)"
.. " %m"
.. "%="
.. "%c%V"
.. " :: %P/%L"
.. " :: %{&et ? 's' : 't'} "

-- }}}

--      "' CODE STYLE '" {{{


-- Default tab sizes
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 0

-- Tabs to spaces by default
vim.opt.expandtab = true

-- Max line length indicator
vim.opt.textwidth = 90

-- Auto indent C
vim.opt.cindent = true
vim.opt.cinoptions = {"0", "l1", "t0", "g0", "(0"}

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},
    callback = function()
        vim.opt.expandtab = false
        vim.opt.shiftwidth = 8
        vim.opt.tabstop = 8
        vim.opt.softtabstop = 8
        vim.opt.textwidth = 80
    end
})

-- }}}

--      "' PLUGINS '" {{{


require "paq" {
    "savq/paq-nvim",

        -- UI Stuff
    -- Indent guides
    "lukas-reineke/indent-blankline.nvim",
    -- Zen mode
    "folke/zen-mode.nvim",
    -- Git signs
    "lewis6991/gitsigns.nvim",

        -- Usability Stuff
    -- Incremental syntax parsing
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- Auto end for Ruby, Lua, etc.
    "RRethy/nvim-treesitter-endwise",
    -- Comments
    "numToStr/Comment.nvim",
    -- Surroundings
    "tpope/vim-surround",
    -- Vim Tmux integration
    "christoomey/vim-tmux-navigator",
    -- Auto close delimiters
    "windwp/nvim-autopairs",
    -- Auto close html tags
    "windwp/nvim-ts-autotag",
    -- Tab out of delimiters
    "kawre/neotab.nvim",
    -- Current project root
    "airblade/vim-rooter",
    -- Save as ROOT
    "lambdalisue/suda.vim",
    -- Editorconfig
    "editorconfig/editorconfig-vim",
    -- Telescope
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- File manager
    "nvim-tree/nvim-tree.lua",
    -- Floating terminals for lazygit and similar
    { "akinsho/toggleterm.nvim", tag = "2.3.0" },
    -- Undo tree like nerdtree
    "mbbill/undotree",
    -- JSX highlighting and indentation
    "maxmellon/vim-jsx-pretty",

        -- LSP
    -- Official LSP configurations
    "neovim/nvim-lspconfig",
    -- LSP installer gui
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Lua Neovim API integration
    "folke/neodev.nvim",
    -- Formatters
    "stevearc/conform.nvim",
    -- Linters
    "mfussenegger/nvim-lint",
    -- jdtls for Java
    "mfussenegger/nvim-jdtls",
    -- Debugger
    "mfussenegger/nvim-dap",

        -- Autocompletion
    -- Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Engine
    "hrsh7th/nvim-cmp",
    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- Snippet collection
    "rafamadriz/friendly-snippets",
}

-- }}}

--          "' PLUGIN CONFIGURATIONS '" {{{


-- "' Treesitter '" {{{


require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c", "cpp", "lua", "javascript", "go", "java", "python", "ruby", "html"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,

        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat,
                vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    endwise = {
        enable = true,
    },
}

-- }}}

-- "' Zen Mode '" {{{


local textwidth = function()
    return vim.api.nvim_get_option_value("textwidth", {}) + 7
end

require("zen-mode").setup({
    window = {
        backdrop = .8,
        width = textwidth,
    },
    plugins = {
        tmux = { enabled = true },
    },
})

mset("n", "<Leader>zz", "<Cmd>ZenMode<CR>")

-- }}}

-- "' Gitsigns '" {{{


local gitsigns = require("gitsigns")
gitsigns.setup {
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    numhl = true,
    diff_opts = {
        algorithm = "myers",
        internal = true,
        indent_heuristic = true,
        vertical = true,
    },
    word_diff = false,
    status_formatter = function(status)
        local added, changed, removed = status.added, status.changed, status.removed
        local status_txt = {}
        if added and added > 0 then table.insert(status_txt, "+" .. added) end
        if changed and changed > 0 then table.insert(status_txt, "~" .. changed) end
        if removed and removed > 0 then table.insert(status_txt, "-" .. removed) end
        return table.concat(status_txt, " ")
    end,
    on_attach = function(bufnr)
        local opts = { buffer = bufnr, remap = false }
        mset("n", "gu", gitsigns.reset_hunk, opts)
        mset("n", "gp", gitsigns.preview_hunk, opts)
        mset("n", "[h", gitsigns.prev_hunk, opts)
        mset("n", "]h", gitsigns.next_hunk, opts)
    end
}

-- }}}

-- "' Comment '" {{{


require("Comment").setup({
    padding = true,
    sticky = true,
    toggler = { line = "gcc", block = "gbb" },
    opleader = { line = "gc", block = "gb" },
    extra = { above = "gcO", below = "gco", eol = "gcA" },
    mappings = { basic = true, extra = true },
---@diagnostic disable-next-line: assign-type-mismatch
    ignore = nil,
---@diagnostic disable-next-line: assign-type-mismatch
    pre_hook = nil,
---@diagnostic disable-next-line: assign-type-mismatch
    post_hook = nil,
})

-- }}}

-- "' nvim-autopairs '" {{{


    local autop = require("nvim-autopairs")
    autop.setup({
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        disable_in_macro = true,  -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable when insert after visual block mode
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true,  -- add bracket pairs after quote
        enable_check_bracket_line = true,  --- check bracket in same line
        enable_bracket_in_quote = true,
        enable_abbr = false, -- trigger abbreviation
        break_undo = true, -- switch for basic rule break undo sequence
        check_ts = false,
        map_cr = true,
        map_bs = true,  -- map the <BS> key
        map_c_h = false,  -- Map the <C-h> key to delete a pair
        map_c_w = false, -- map <c-w> to delete a pair if possible
    })

    local Rule = require("nvim-autopairs.rule")
    -- local cond = require("nvim-autopairs.conds")

    -- Do CR with angle brackets in .erb
    autop.add_rule(Rule(
    ">[%w%s]*$",
    "^%s*<[/%%]",
    {
        "eruby",
    }
    ):only_cr():use_regex(true))

-- }}}

-- "' nvim-ts-autotag '" {{{


    require('nvim-ts-autotag').setup({
        opts = {
            -- Defaults
            enable_close = true, -- Auto close tags
            enable_rename = false, -- Auto rename pairs of tags
            enable_close_on_slash = true -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {}
    })

-- }}}

-- "' neotab '" {{{


require("neotab").setup({
    tabkey = "<Tab>",
    act_as_tab = true,
    behavior = "nested", ---@type ntab.behavior
    pairs = { ---@type ntab.pair[]
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "<", close = ">" },
    },
    exclude = {},
    smart_punctuators = {
        enabled = false,
        semicolon = {
            enabled = false,
            ft = { "cs", "c", "cpp", "java" },
        },
        escape = {
            enabled = false,
            triggers = {}, ---@type table<string, ntab.trigger>
        },
    },
})

-- }}}

-- "' Suda '" {{{


vim.g["suda#executable"] = "doas"
vim.g["suda#nopass"] = 1
vim.g["suda_smart_edit"] = 1

-- }}}

-- "' Editorconfig '" {{{


vim.g.EditorConfig_max_line_indicator = "none"

-- }}}

-- "' Telescope '" {{{


local builtin = require("telescope.builtin")

mset("n", "<leader>s", builtin.find_files)
mset("n", "<leader>ss", builtin.find_files)
mset("n", "<leader>sa", builtin.live_grep)
mset("n", "<leader>sb", builtin.buffers)
mset("n", "<leader>sh", builtin.help_tags)
mset("n", "<leader>sl", builtin.lsp_document_symbols)
mset("n", "<leader>sr", builtin.lsp_references)

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = "close",
                ["<C-h>"] = "which_key",
            },
        },
        preview = {
            treesitter = false,
        },
        file_ignore_patterns = {
            "^.git/"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(_)
                return {"--hidden"}
            end,
        },
    },
}

-- }}}

-- "' nvim-tree '" {{{


require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_focused_file = {
      enable = true,
  },
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    icons = {
        glyphs = {
            git = {
                unstaged = "US",
                staged  = "ST",
                unmerged = "UM",
                renamed = "RE",
                untracked = "UT",
                deleted = "DE",
                ignored = "IG",
            },
        }
    }
  },
  filters = {
    dotfiles = false,
  },
})

mset("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>")

-- }}}

-- "' toggleterm '" {{{


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

mset("n", "<Leader>g", function() lazygit:toggle() end,
    { noremap = true, silent = true })
mset("n", "<Leader>t", function() fish:toggle() end,
    { noremap = true, silent = true })

-- }}}

-- "' Undotree '" {{{


mset("n", "<leader>u", vim.cmd.UndotreeToggle)

-- }}}

-- "' neodev '" {{{


    require("neodev").setup()

-- }}}

-- "' Mason '" {{{


local lspconfig = require("lspconfig")
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()
local conform = require("conform")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

mason_lspconfig.setup_handlers {
    function (server)
        if server ~= "jdtls" then
            lspconfig[server].setup {}
        end
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup {
            cmd = {
                "clangd",
                "--all-scopes-completion",
                "--clang-tidy"
            }
        }
    end,
    ["html"] = function()
        lspconfig.html.setup {
            filetypes = { "html", "eruby", "php" },
            capabilities = capabilities,
        }
    end,
    ["phpactor"] = function()
        lspconfig.phpactor.setup {
            cmd = {
                "phpactor",
                "language-server",
            }
        }
    end
}

lspconfig.solargraph.setup {
    capabilities = capabilities,
    settings = {
        solargraph = {
            useBundler = true,
            diagnostics = true,
        }
    }
}

local function jdtls_setup(event)
    local masonreg = require("mason-registry")
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local data_dir = "/tmp/eclipse.jdt.ls/" .. project_name

    local jdtls = require("jdtls")

    local jdtls_dir = masonreg.get_package('jdtls'):get_install_path()

    local launcher_jar = vim.fn.glob(jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_*.jar')

    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {

            -- 💀
            'java', -- or '/path/to/java21_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            -- 💀
            '-jar', launcher_jar,

            -- 💀
            '-configuration', jdtls_dir .. '/config_linux',


            -- 💀
            -- See `data directory configuration` section in the README
            '-data', data_dir
        },

        -- 💀
        -- This is the default if not provided, you can remove it. Or adjust as needed.
        -- One dedicated LSP server & client will be started per unique root_dir
        --
        -- vim.fs.root requires Neovim 0.10.
        -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", ".maven", "pom.xml"}),

        capabilities = capabilities,

        flags = {
            allow_incremental_sync = true,
        },

        init_options = {
            extendedClientCapabilities = jdtls.extendedClientCapabilities,
            bundles = {
                vim.fn.glob(masonreg.get_package("java-debug-adapter"):get_install_path()
                    .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
            },
        },

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
            java = {
                eclipse = {
                    downloadSources = true,
                },
                maven = {
                    downloadSources = true,
                },
                configuration = {
                    updateBuildConfiguration = "interactive",
                    maven = {
                        -- IMPORTANT: This is necessary because I modify the .m2 path in
                        -- my settings.xml that is stored in a different location.
                        -- Without this, the "mvn" command I run in my shell and jdtls
                        -- run will use different .m2 paths creating conflicts.
                        userSettings = os.getenv("HOME") .. "/.config/maven/settings.xml"
                    }
                },
                implementationsCodeLens = {
                    enabled = true,
                },
                referencesCodeLens = {
                    enabled = true,
                },
                references = {
                    includeDecompiledSources = true,
                },
                inlayHints = {
                    enabled = true,
                },
                format = {
                    enabled = true,
                },
                import = {
                    gradle = {
                        enabled = false,
                    },
                    maven = {
                        enabled = true,
                    }
                },
            },
            signatureHelp = {
                enabled = true,
            },
            contentProvider = {
                preferred = "fernflower",
            },
            extendedClientCapabilities = jdtls.extendedClientCapabilities,
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                }
            },
            codeGeneration = {
                useBlocks = true,
            }
        },
        on_attach = function(client, bufnr)
            if client.name == "jdtls" then
                jdtls.setup_dap({ hotcodereplace = "auto" })
                -- Auto-detect main and setup dap config
                require("jdtls.dap").setup_dap_main_class_configs({
                    config_overrides = {
                        vmArgs = "-Dspring.profiles.active=local",
                    },
                })
            end
        end,
    }

    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    jdtls.start_or_attach(config)
end

vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = { 'java' },
    desc = 'setup jdtls',
    callback = jdtls_setup,
})

-- }}}

-- "' nvim-lspconfig '" {{{


local opts = { remap = false }
mset("n", "<leader>w", vim.diagnostic.open_float, opts)
mset("n", "[d", vim.diagnostic.goto_prev, opts)
mset("n", "]d", vim.diagnostic.goto_next, opts)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local lopts = { buffer = ev.buf }
    mset("n", "gD", vim.lsp.buf.declaration, lopts)
    mset("n", "gd", vim.lsp.buf.definition, lopts)
    mset("n", "K", vim.lsp.buf.hover, lopts)
    mset("n", "gi", vim.lsp.buf.implementation, lopts)
    mset("i", "<C-k>", vim.lsp.buf.signature_help, lopts)
    mset("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, lopts)
    mset("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, lopts)
    mset("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    mset("n", "<leader>D", vim.lsp.buf.type_definition, lopts)
    mset("n", "<leader>r", vim.lsp.buf.rename, lopts)
    mset({ "n", "v" }, "<leader>f", vim.lsp.buf.code_action, lopts)
    mset("n", "gr", vim.lsp.buf.references, lopts)
    mset("n", "<leader>F", function()
      conform.format { async = true, lsp_fallback = true }
    end, opts)
  end,
})

-- }}}

-- "' conform '" {{{


    conform.setup({
        format_after_save = {
            lsp_fallback = false, -- THIS DOES UNWANTED FORMATTING AND FUCK UP EVERYTHING! KEEP IT "false".
            timeout_ms = 500,
        },
        formatters_by_ft = {
            ruby = { "rubocop" },
            eruby = { "rustywind", "rubocop" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            php = { "php_cs_fixer" },
            go = { lsp_format = "fallback" },
            java = { "google-java-format" },
        },
        formatters = {
            erb_format = {
                args = { "--print-width=90", "--stdin" }
            }
        }
    })

-- }}}

-- "' nvim-dap '" {{{


local dap = require("dap")
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
    debug = {
        settings = {
            hotCodeReplace = "auto"
        }
    }
  },
}

-- }}}

-- "' nvim-cmp '" {{{


local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")
luasnip.filetype_extend("ruby", {"rails"})
luasnip.filetype_extend("eruby", {"html"})
cmp.setup({
    matching = {
      disallow_fuzzy_matching = false,
      disallow_fullfuzzy_matching = false,
      disallow_partial_fuzzy_matching = false,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = false,
      disallow_symbol_nonprefix_matching = false,
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<S-Tab>"] = cmp.mapping.complete({}),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-o>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    })
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" }
      }
    }
  })
})

-- }}}

-- "' nvim-lint '" {{{


    local lint = require("lint")
    lint.linters_by_ft = {
        eruby = {"erb_lint"},
        html = {"erb_lint"}
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            lint.try_lint()
        end,
    })

-- }}}

-- }}}
