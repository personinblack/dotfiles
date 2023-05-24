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

set -xg BAT_THEME "Sublime Snazzy"

set -xg npm_config_prefix $HOME/.local

set -xg IMGUR_CLIENT_ID 9b4d6c50beb51ee
set -xg IMGUR_XSEL_OPTIONS "-b"

# }}}

#       "' SOURCES '" {{{


#if type -q thefuck
#  thefuck --alias | source
#end

# }}}

#       "' ALIASES '" {{{


if type -q exa
  abbr -ag l "exa"
  abbr -ag lsa "exa -la"
  abbr -ag tree "exa --tree"
end

abbr -ag :q exit
abbr -ag py "python -S" # Python without "Site-specific conf hook", hist file

function git
  if test $argv[1] = "log"
    if test -z $argv[2]
      command git log --graph --branches --stat
    else
      command git $argv
    end
  else
    command git $argv
  end
end

abbr -ag g "git"
abbr -ag gst "git status"
abbr -ag gch "git checkout"
abbr -ag gad "git add"
abbr -ag gco "git commit"
abbr -ag gpu "git push"
abbr -ag gbr "git branch"
abbr -ag gdi "git diff"
abbr -ag glo "git log"

alias youtube-dl yt-dlp
alias sudo doas

# }}}

#       "' FZF '" {{{


if type -q fzf
  set -xg FZF_DEFAULT_NF_COMMAND "rg --hidden -g '!**.git/**' -g '!**cache**/**'"
  set -xg FZF_DEFAULT_COMMAND "$FZF_DEFAULT_NF_COMMAND --files"
  set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
end

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
set -xg GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle
set -xg _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -xg NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -xg DVDCSS_CACHE "$XDG_DATA_HOME"/dvdcss
set -xg W3M_DIR "$XDG_CONFIG_HOME/w3m"
set -xg WGETRC "$XDG_CONFIG_HOME/wgetrc"

alias tmux "tmux -f $HOME/.config/tmux/tmux.conf"
alias nvidia-settings "nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"
alias yarn "yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"

function ngrok
  command ngrok $argv --config "$HOME/.config/ngrok2/ngrok.yml"
end

function mvn
  command mvn $argv -gs "$XDG_CONFIG_HOME"/maven/settings.xml
end

# }}}

#       "' BEAUTY '" {{{


set lucid_skip_newline true

# }}}

#       "' RUN TMUX '" {{{


if test "$TERM" != "linux" && not set -q TMUX
  exec tmux -f $HOME/.config/tmux/tmux.conf new -As def
  exit
end

# }}}
