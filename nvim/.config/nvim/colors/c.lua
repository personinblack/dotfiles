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
    _ac = "#464646",
    _ad = "#6b6b6b",
    _ae = "#717171",
    _af = "#7c7c7c",
    _ag = "#8a8a8a",
    _ah = "#b5cabb",
    _ba = "#999999",
    _bb = "#adadad",
    _bc = "#b3b3b3",
    _bd = "#c0c0c0",
    _be = "#c4c4c4",
    _bf = "#eeeeee",
    _bg = "#f8f8f8",
    _bh = "#99ac93",
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
-- QuickFixLine
-- PmenuKind, PmenuKindSel, PmenuExtra, PmenuExtraSel (haven't seen these in use)

-- "' General'" {{{


cm.Normal      = { fg = c.ffg, bg = c.bbg }
cm.ColorColumn = { fg = c.nul, bg = c._aa } -- line limit indicator
cm.CursorLine  = cm.ColorColumn             -- the line we are at
cm.Folded      = { fg = c.bbg, bg = c._ag }
cm.MatchParen  = { fg = c._bb, bg = c._ac }
cm.SpecialKey  = { fg = c.bbg, bg = c._bc } -- 
cm.NonText     = { fg = c._ab, bg = c.bbg } -- bottom of the editor when there is nil
cm.Visual      = { fg = c.nul, bg = c._ab }
cm.WarningMsg  = { fg = c.bbg, bg = c._ag } -- search hit bottom
cm.Whitespace  = { fg = c.nul, bg = c.nul } -- . . . nul means same color as preceding

-- }}}

-- "' Number Column'" {{{


cm.DiffAdd        = { fg = c._be }             -- TODO: set with gitsigns
cm.DiffChange     = { fg = c._be }
cm.DiffDelete     = { fg = c._ac }
cm.DiffText       = { underline = true }       -- im missing this
cm.LineNr         = { fg = c._ad, bg = c.bbg } -- line numbers
cm.FoldColumn     = { fg = c._aa, bg = c.bbg }
cm.SignColumn     = { fg = c._ah, bg = c.bbg }
cm.CursorLineNr   = { fg = c._ah, bg = c.bbg } -- selected line number
cm.CursorLineFold = cm.CursorLineNr
cm.CursorLineSign = cm.CursorLineNr

-- }}}

-- "' Search '" {{{


cm.Search     = { reverse = true } -- last search highlights (off for me)
cm.IncSearch  = { reverse = true } -- current search highlights
cm.Substitute = cm.IncSearch       -- search && replace hightlights

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


cm.WinSeparator = cm.MsgSeparator            -- TODO: may set bg to c.nul for small
cm.TabLine      = { fg = cm.StatusLine.fg,
                    bg = cm.StatusLine.bg  }
cm.TabLineFill  = { fg = c.nul, bg = c.bbg }
cm.TabLineSel   = { fg = c.bbg, bg = c._af }
cm.Title        = { bold = true            } -- tab numbers && cmd output titles
cm.WinBar       = veryred                    -- you using winbar??! this is not vscode
cm.WinBarNC     = veryred

-- }}}

-- "' File Listings'" {{{


cm.Directory = { fg = c._ac, bg = c.nul } -- NvimTree folders

-- }}}

-- "' Popups '" {{{

cm.Pmenu       = { fg = c.bbg, bg = c._af } -- mostly auto completion popup
cm.PmenuSel    = { fg = c._ba, bg = c._bc }
cm.NormalFloat = { fg = c.ffg, bg = c._aa }
cm.FloatBorder = cm.NormalFloat
cm.FloatTitle  = cm.NormalFloat

-- }}}

-- "' Syntax '" {{{


cm.Comment        = { fg = c._ac }
cm.Constant       = { fg = c._bc, italic = true }
cm.String         = { fg = c._bf, italic = true }
cm.Character      = { fg = c._bf, italic = true }
cm.Number         = { fg = c._bf, italic = true }
cm.Boolean        = { fg = c._bf, italic = true }
cm.Float          = { fg = c._bf, italic = true }
cm.Identifier     = { fg = c._bc }
cm.Function       = { fg = c._bc }
cm.Statement      = { fg = c._ad }
-- cm.Conditional    = cm.Statement
-- cm.Repeat         = cm.Statement
-- cm.Label          = cm.Statement
cm.Operator       = { fg = c._af }
-- cm.Keyword        = cm.Statement
-- cm.Exception      = cm.Statement
cm.PreProc        = { fg = c._ad }
-- cm.Include        = cm.PreProc
-- cm.Define         = cm.PreProc
-- cm.Macro          = cm.PreProc
-- cm.PreCondit      = cm.PreProc
cm.Type           = { fg = c._ag }
-- cm.StorageClass   = cm.Type
-- cm.Structure      = cm.Type
-- cm.Typedef        = cm.Type
cm.Special        = { fg = c._ae }
-- cm.SpecialChar    = cm.Special
-- cm.Tag            = cm.Special
-- cm.Delimiter      = cm.Special
-- cm.SpecialComment = cm.Special
-- cm.Debug          = cm.Special
cm.Underlined     = { underline = true }
cm.Ignore         = { fg = c._ab }
cm.Error          = { bold = true, undercurl = true }
cm.Todo           = { italic = true }

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
