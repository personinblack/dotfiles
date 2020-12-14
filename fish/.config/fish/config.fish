# vim:fileencoding=utf-8:foldmethod=marker:softtabstop=2:shiftwidth=2
#
#          fish Configuration File
#
# Author: personinblack
# GitHub: https://github.com/personinblack/dotfiles
#

#       "' SSH AGENT '" {{{


set -e SSH_AGENT_PID
if not set -q SSH_AUTH_SOCK
  set -xg SSH_AUTH_SOCK "/run/user/1000/gnupg/S.gpg-agent.ssh"
end

# }}}

#       "' ENVIRONMENT VARIABLES '" {{{


set -xg PATH $HOME/.local/share/cargo/bin $HOME/.local/bin $PATH
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg XDG_DATA_HOME $HOME/.local/share

if set -q SSH_CONNECTION
  set -xg EDITOR "vim"
else
  set -xg EDITOR "nvim"
end

# }}}

#       "' SOURCES '" {{{


source /usr/share/chruby/chruby.fish
set RUBIES "$HOME/.local/share/rubies/ruby-2.6.5" $RUBIES
source /usr/share/chruby/auto.fish
thefuck --alias | source

# }}}

#       "' ALIASES '" {{{


abbr --add l "exa"
abbr --add lsa "exa -la"
abbr --add tree "exa --tree"
abbr --add :q exit
abbr --add aura "aura -c 'c1 c7'"

# }}}

#       "' FZF '" {{{


set -xg FZF_DEFAULT_NF_COMMAND "rg --hidden -g '!**.git/**'"
set -xg FZF_DEFAULT_COMMAND "$FZF_DEFAULT_NF_COMMAND --files"
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# }}}

#       "' CLEANUP '" {{{


set -xg XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -xg LESSHISTFILE "-"
set -xg TERMINFO "$XDG_DATA_HOME/terminfo"
set -xg CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -xg CARGO_HOME "$XDG_DATA_HOME"/cargo
set -xg BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -xg BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -xg BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
set -xg DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -xg GEM_HOME "$XDG_DATA_HOME"/gem
set -xg GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
#set -xg GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -xg RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -xg GOPATH "$XDG_DATA_HOME"/go

alias tmux "tmux -f $HOME/.config/tmux/tmux.conf"
alias nvidia-settings "nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"

# }}}

#       "' BEAUTY '" {{{


set SPACEFISH_CHAR_SYMBOL "➜ "

# }}}

#       "' RUN TMUX '" {{{


if test "$TERM" != "linux" && not set -q TMUX
  exec tmux -f $HOME/.config/tmux/tmux.conf new -As def
  exit
end

# }}}
