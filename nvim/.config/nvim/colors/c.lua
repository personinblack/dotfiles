-- vim:fileencoding=utf-8:foldmethod=marker:softtabstop=4:shiftwidth=4
--
--          NVIM Colorscheme
--
-- Author: personinblack
-- GitHub: https://github.com/personinblack/dotfiles
--

-- "' Colors '" {{{


local c = {
    nul = "NONE",
    bbg = "#000000",
    ffg = "#ffffff",

    -- very dark
    _aa = "#1a1a1a",
    _ab = "#333333",
    _ac = "#4d4d4d",
    _ad = "#666666",
    _ae = "#707070",
    _af = "#7a7a7a",
    _ag = "#858585",
    _ah = "#848f81",
    _ba = "#999999",
    _bb = "#a3a3a3",
    _bc = "#adadad",
    _bd = "#b8b8b8",
    _be = "#c2c2c2",
    _bf = "#d1d1d1",
    _bg = "#dedede",
    _bh = "#c6e6bc",
    -- very light
}

-- }}}

-- "' Highlight Groups '" {{{


local cm   = {}
local veryred = { fg = "#ff0000", bg = "#ff0000" }

-- TODO:
-- look at:
-- NormalFloat, FloatBorder, FloatTitle
-- maybe NormalNC for dimming?
--
-- don't know if should be set:
-- Question (probably already set as MoreMsg)
-- PmenuKind, PmenuKindSel, PmenuExtra, PmenuExtraSel (haven't seen these in use)

-- "' General'" {{{


cm.Normal               = { fg = c.ffg, bg = c.bbg }
cm.ColorColumn          = { fg = c.nul, bg = c._aa } -- line limit indicator
cm.CursorLine           = cm.ColorColumn             -- the line we are at
cm.Folded               = { fg = c.bbg, bg = c._af }
cm.MatchParen           = { fg = c.bbg, bg = c._ac }
cm.SpecialKey           = { fg = c._ah, bg = c._ab } -- 
cm.NonText              = { fg = c._ab, bg = c.bbg } -- bottom of the editor when there is nil
cm.Visual               = { fg = c.nul, bg = c._ab }
cm.WarningMsg           = { fg = c.bbg, bg = c._ag } -- search hit bottom
cm.Whitespace           = { fg = c.nul, bg = c.nul }
cm.GitSignsChangeInline = { fg = c.bbg, bg = c._ae }
cm.GitSignsAddInline    = { fg = c.bbg, bg = c._ah }
cm.GitSignsDeleteInline = { fg = c.nul, bg = c._aa }

-- }}}

-- "' Number Column'" {{{


cm.LineNr               = { fg = c._ad, bg = c.bbg } -- line numbers
cm.FoldColumn           = { fg = c._aa, bg = c.bbg }
cm.SignColumn           = { fg = c._ah, bg = c.bbg }
cm.CursorLineNr         = { fg = c._ah, bg = c.bbg } -- selected line number
cm.CursorLineFold       = cm.CursorLineNr
cm.CursorLineSign       = cm.CursorLineNr
cm.DiffAdd              = { fg = c._bh }
cm.DiffChange           = { fg = c._bf }
cm.DiffDelete           = { fg = c._ah }
cm.Added                = cm.DiffAdd
cm.Changed              = cm.DiffChange
cm.Removed              = cm.DiffDelete

-- }}}

-- "' Search '" {{{


cm.Search     = { bg = c._ab, fg = c._bb } -- last search highlights
cm.CurSearch  = { bg = cm.Search.fg,       -- current search
                  fg = cm.Search.bg }
cm.Substitute = cm.CurSearch               -- search && replace hightlights
cm.IncSearch  = cm.Search                  -- replace confirmation highlights

-- }}}

-- "' Status and Command Line'" {{{


cm.MsgSeparator = { fg = c._ad, bg = c._ad } -- for separating editor and cmdline
cm.MsgArea      = { fg = c._bc, bg = c.bbg } -- cmdline
cm.ErrorMsg     = { reverse = true         } -- cmdline errors
cm.ModeMsg      = { fg = c._ac, bg = c.bbg } -- "-- INSERT --" at the bottom left
cm.MoreMsg      = { fg = c._be, bg = c._ab } -- "Press enter to continue" message at cmd
cm.StatusLine   = { fg = c._af, bg = c.bbg,
                    reverse = true         }
cm.StatusLineNC = { fg = c._af, bg = c._aa }

-- }}}

-- "' Windows and Tabs'" {{{


cm.WinSeparator = { fg = cm.MsgSeparator.fg,
                    bg = c.nul }
cm.TabLine      = { fg = cm.StatusLine.fg,
                    bg = cm.StatusLine.bg  }
cm.TabLineFill  = { fg = c.nul, bg = c.bbg }
cm.TabLineSel   = cm.StatusLine
cm.Title        = { bold = true            } -- tab numbers && cmd output titles
cm.WinBar       = veryred                    -- you using winbar??! this is not vscode
cm.WinBarNC     = veryred

-- }}}

-- "' File Listings'" {{{


cm.Directory = { fg = c._ac, bg = c.nul } -- NvimTree folders
cm.NvimTreeFolderIcon = { fg = c._ah, bg = c.nul } -- NvimTree folders

-- }}}

-- "' Popups '" {{{

cm.Pmenu       = { fg = c.bbg, bg = c._ad } -- mostly auto completion popup
cm.PmenuSel    = { fg = c.bbg, bg = c._ah }
cm.NormalFloat = { fg = c._ah, bg = c._aa }
cm.FloatBorder = cm.NormalFloat
cm.FloatTitle  = cm.NormalFloat
cm.PmenuKind   = veryred
cm.PmenuKindSel   = veryred
cm.PmenuExtra     = veryred
cm.PmenuExtraSel  = veryred

-- }}}

-- "' Syntax '" {{{


cm["@variable"]   = { fg = c._bc }
cm.Comment        = { fg = c._ac }
cm.Constant       = { fg = c._be, italic = true }
cm.String         = { fg = c._bh, italic = true }
cm.Character      = cm.String
cm.Number         = { fg = c._bh, italic = true }
cm.Boolean        = { fg = c._bh, italic = true }
cm.Float          = { fg = c._bh, italic = true }
cm.Identifier     = { fg = c._ag }
cm.Function       = { fg = c._af }
cm.Statement      = { fg = c._bg }
-- cm.Conditional    = cm.Statement
-- cm.Repeat         = cm.Statement
-- cm.Label          = cm.Statement
cm.Operator       = { fg = c._ad }
-- cm.Keyword        = cm.Statement
-- cm.Exception      = cm.Statement
cm.PreProc        = cm.Statement
-- cm.Include        = cm.PreProc
-- cm.Define         = cm.PreProc
-- cm.Macro          = cm.PreProc
-- cm.PreCondit      = cm.PreProc
cm.Type           = { fg = c._be }
-- cm.StorageClass   = cm.Type
-- cm.Structure      = cm.Type
-- cm.Typedef        = cm.Type
cm.Special        = { fg = c._bf }
-- cm.SpecialChar    = cm.Special
-- cm.Tag            = cm.Special
cm.Delimiter      = { fg = c._ad }
-- cm.SpecialComment = cm.Special
-- cm.Debug          = cm.Special
cm.Underlined     = { underline = true }
cm.Ignore         = { fg = c._ab }
cm.Error          = { bold = true, undercurl = true }
cm.Todo           = { fg = c.bbg, bg = c._bh, bold = true }

-- }}}

-- }}}

vim.o.background = "dark"
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

-- set highlight groups globally
for name, color in pairs(cm) do
    vim.api.nvim_set_hl(0, name, color)
end
