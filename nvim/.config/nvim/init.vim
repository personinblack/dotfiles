" vim:fileencoding=utf-8:foldmethod=marker:softtabstop=2:shiftwidth=2
"
"          N/VIM Configuration File
"
" Author: personinblack
" GitHub: https://github.com/personinblack/dotfiles
"

        "' PLUGINS '" {{{


call plug#begin('~/.config/nvim/plugins')


  " Usability Stuff
" Vim tmux movement integration
Plug 'christoomey/vim-tmux-navigator'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Git branch viewer
Plug 'rbong/vim-flog'
" Editorconfig
Plug 'editorconfig/editorconfig-vim'
" Correct project root
Plug 'airblade/vim-rooter'
" Surroundings
Plug 'tpope/vim-surround'


  " UI Stuff
" Color Theme
Plug 'bluz71/vim-moonfly-colors'
" Tree view sidebar
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
" Git diff visualizer
Plug 'airblade/vim-gitgutter'
" Statusbar
Plug 'vim-airline/vim-airline'
" Indent guides
Plug 'yggdroot/indentline'
" Distraction-free writing
Plug 'junegunn/goyo.vim'
" FZF
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'


  " Semantic Language
" Intellisense && completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'


  " Syntactic Language
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular' " Required for markdown
Plug 'plasticboy/vim-markdown'
" Ruby end stuff
Plug 'tpope/vim-endwise'
" Auto close brackets, quotes, paranthesis
Plug 'raimondi/delimitmate'
" Match open/close and jump between (key: %)
Plug 'andymass/vim-matchup'
" Commenter
Plug 'scrooloose/nerdcommenter'

call plug#end()


" }}}

        "' KEYBINDINGS '" {{{


" Leader key
let mapleader = ' '


  " Navigation
" New pane (these are not regular dash and comma chars, they are made with the CTRL-v)
nnoremap - :new<CR>
nnoremap , :vnew<CR>

" Previous buffer
map <Leader><Leader> <c-^>

" git-gutter next/previous hunk
nmap >h <Plug>GitGutterNextHunk
nmap <h <Plug>GitGutterPrevHunk

" Fzf search file contents
noremap <leader>a :Grep<cr>

" Fzf search file names
noremap <leader>s :Files<cr>


  " Remapping
" >/<, [/], {/} keys (pardon my language)
map ç >
map ö <
map ğ [
map ü ]
map Ğ {
map Ü }

" Copy to/paste from clipboard shortcuts
"map <C-y> "+y
"map <C-p> "+p

" Tab intellisense
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Unmap arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


  " Function Calls
" Toggle transparency
nnoremap <C-t> : call Toggle_transparent()<CR>


  " Plugin Toggle
" ALEHover
nnoremap <silent> K :ALEHover<CR>
" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" Goyo toggle
map <C-z> :Goyo<CR>


  " Plugin Other
" Coc execute codeLens
nmap <leader>t <Plug>(coc-codelens-action)
" Coc rename
nmap <leader>r <Plug>(coc-rename)
" Coc codeaction
nmap <leader>f <Plug>(coc-codeaction-selected)<CR>
xmap <leader>f <Plug>(coc-codeaction-selected)
" Coc references
nmap <leader>dr <Plug>(coc-references)
" Coc definition
nmap <leader>dd <Plug>(coc-definition)
" Coc implementation
nmap <leader>di <Plug>(coc-implementation)
" Coc hover
nmap <leader>w :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" }}}

        "' COMMANDS '" {{{


" Bind :Q to :q
command! Q q


"}}}

        "' FUNCTIONS '" {{{


" Transparency
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction


"}}}

        "' GENERAL CONFIGURATION '" {{{


" This is needed for so much stuff but I don't really understand it
filetype plugin indent on


  " Visual
" Set colorscheme
colorscheme moonfly
" Use GUI colors
if (has("termguicolors"))
  set termguicolors
endif

" Syntax highlighting
syntax on
set synmaxcol=180

" Remove background color
exec "highlight Normal guibg=NONE ctermbg=NONE"

" Enable line numbers
set rnu

" Highlight line limit
set colorcolumn=90

" Highlight cursor line
set cursorline

" Show matching brackets/parenthesis
set showmatch

" Show invisible chars
set list
set listchars=
set listchars+=tab:⭾.
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" Natural split behavior
set splitbelow
set splitright

" Give more space for displaying messages
set cmdheight=2


  " Code Style
" Tabs to spaces
set expandtab

" Default tab size
set softtabstop=4
set shiftwidth=4


  " Editor Improvements
" Keep the undo history
set undofile
set undodir=~/.local/share/nvim/undo

" Make some space around the cursor
set scrolloff=10

" Ripgrep as default grep
set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m

" Add current dir to path and allow fuzzy finding
set path+=**
set wildmode=list:full
set wildmenu
set wildignorecase

" Case insensitive search
set ignorecase
set smartcase

" Set correct shell
set shell=$SHELL\ -l


  " Fixes
" Vim update faster (for git-gutter, syntax checks, etc.)
set updatetime=100

" Keypress wait time
set timeoutlen=500

" Don't know if this is still useful
set conceallevel=0

" Set buffer hidden instead of unloading when it is abondoned (coc needs this)
set hidden


" }}}

        "' PLUGIN CONFIGURATIONS '" {{{


  " NERDTree
" Show NERDTree while working with a directory
augroup NERDTREE_AUTO_RUN
    au!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
augroup END


  " IndentLine
" IndentColor
let g:indentLine_color_term = 0

" Fix JSON
augroup JSON_NO_INDENT
    au!
    autocmd BufEnter *.json IndentLinesDisable
    autocmd BufEnter *.md   IndentLinesDisable
augroup END


  " Editorconfig
" Fix Fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']


  " Goyo
" Width
let g:goyo_width = 100

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nu
  set colorcolumn=90
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=10

  " Remove background color
  exec "highlight Normal guibg=NONE ctermbg=NONE"
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


  " Ale
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 1
let g:ale_virtualtext_cursor = 1
highlight link ALEWarningSign Todo
highlight link ALEErrorSign WarningMsg
highlight link ALEVirtualTextWarning Todo
highlight link ALEVirtualTextInfo Todo
highlight link ALEVirtualTextError WarningMsg
highlight ALEError guibg=None
highlight ALEWarning guibg=None
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"

" Rust
let g:ale_rust_rls_config = {
        \ 'rust': {
                \ 'all_targets': 1,
                \ 'build_on_save': 0,
                \ 'clippy_preference': 'on'
        \ }
        \ }
let g:ale_linters = {'rust': ['rls']}


  " fzf with ripgrep
" At the bottom with 40% size
let g:fzf_layout = { 'down': '~40%' }

" File content search format
let fzfcmd = $FZF_DEFAULT_NF_COMMAND
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   fzfcmd.' --column --line-number --no-heading --color=always --smart-case '
  \    .shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:60%'), <bang>0)

" File name search format
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


  " Markdown
" Fix folding by setting it to python style
let g:vim_markdown_folding_style_pythonic = 1

" Disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


" }}}
