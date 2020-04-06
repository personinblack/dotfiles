# vim:fileencoding=utf-8:foldmethod=marker:softtabstop=2:shiftwidth=2
#
#          ZSH Configuration File
#
# Author: personinblack
# GitHub: https://github.com/personinblack/dotfiles
#

#       "' SSH AGENT '" {{{


unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# }}}

#       "' ENVIRONMENT VARIABLES '" {{{


export PATH=$PATH:~/.local/bin

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# }}}

#       "' GENERAL ZSH AND OH-MY-ZSH '" {{{


# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

  # Config Variables
# Set theme
ZSH_THEME="null"

# Disable updates
DISABLE_AUTO_UPDATE="true"

# Enable auto command correction
ENABLE_CORRECTION="true"

# Red dot while waiting
COMPLETION_WAITING_DOTS="true"

# Faster Git repository checks
DISABLE_UNTRACKED_FILES_DIRTY="true"

HYPHEN_INSENSITIVE="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=5000

plugins=(git copyfile sudo tmux zsh-autosuggestions)

setopt appendhistory autocd extendedglob

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# }}}

#       "' COMPLETION '" {{{


zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SSS: %p%s
zstyle :compinstall filename '/home/menfie/.zshrc'

autoload -Uz compinit
compinit

# }}}

#       "' ALIASES '" {{{


alias l="exa"
alias lsa="exa -la"
alias tree="exa --tree"
alias :q=exit
alias aura="aura -c 'c4 c6'"
if command -v thefuck >/dev/null 2>&1; then
  fuck() {
    eval "$(thefuck --alias)" && fuck
  }
fi

# }}}

#       "' FZF '" {{{


export FZF_DEFAULT_COMMAND='rg --files'

FDIR="/usr/share/fzf"
[ -f $FDIR/key-bindings.zsh ] && source $FDIR/key-bindings.zsh\
                              && source $FDIR/completion.zsh

# }}}

if [[ $TERM != linux && ! $TMUX ]]; then
  tmux new -As def; exit
fi
