-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_focused_file = {
      enable = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
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

vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>")
