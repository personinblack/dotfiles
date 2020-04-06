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


set -xg PATH $HOME/.cargo/bin $PATH
set -xg PATH $HOME/.local/bin $PATH

if set -q SSH_CONNECTION
  set -xg EDITOR "vim"
else
  set -xg EDITOR "nvim"
end

# }}}

#       "' SOURCES '" {{{


source /usr/share/chruby/chruby.fish
source /usr/share/chruby/auto.fish
thefuck --alias | source

# }}}

#       "' ALIASES '" {{{


abbr --add l "exa"
abbr --add lsa "exa -la"
abbr --add tree "exa --tree"
abbr --add :q exit
abbr --add aura "aura -c 'c4 c6'"

# }}}

#       "' FZF '" {{{


set -xg FZF_DEFAULT_NF_COMMAND "rg --hidden -g '!**.git/**'"
set -xg FZF_DEFAULT_COMMAND "$FZF_DEFAULT_NF_COMMAND --files"
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# }}}

#       "' RUN TMUX '" {{{


if test "$TERM" != "linux" && not set -q TMUX
  exec tmux new -As def
  exit
end

# }}}
