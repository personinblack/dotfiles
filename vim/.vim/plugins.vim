"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ xero <x@xero.nu>
" ░▓ code   ▓ http://code.xero.nu/dotfiles
" ░▓ mirror ▓ http://git.io/.files
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
"
set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" git {
  Plug 'airblade/vim-gitgutter' " Git Line Change Indicator Stuff
  Plug 'tpope/vim-fugitive' " So Many Git Stuff...
  Plug 'junegunn/gv.vim', { 'on': 'GV' } " Git Commit Browser
" }

" stylize {
  Plug 'scrooloose/nerdtree' " File Explorer
  Plug 'itchyny/lightline.vim' " Status Bar
  Plug 'lilydjwg/colorizer' " Colors for Texts Like #rgba
" }

" features {
  Plug 'matze/vim-move' " Move Lines and Selections Up and Down
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Distraction Free Writing Like The Zen Mode of VSC
  Plug 'junegunn/limelight.vim', { 'on': 'Goyo' } " Spotlight Type of Stuff Mixed With Above Plugin
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " You Know What This Is

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } " Fuzzy Finder
  Plug 'junegunn/fzf.vim' " Fuzzy Finder Vim Plugin

  Plug 'tpope/vim-surround' " Wrapper for Brackets and Other Stuff
  Plug 'editorconfig/editorconfig-vim' " Isolated Config Files for Projects and Languages

  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " Conquer of Completion, intellisense engine
" }

call plug#end()
