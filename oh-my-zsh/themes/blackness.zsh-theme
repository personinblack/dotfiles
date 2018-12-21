precmd() {
    echo
}

PROMPT='%{$fg_bold[magenta]%}_> %{$reset_color%}'
RPROMPT='%{$fg_bold[green]%}$(git_prompt_info) @ ${PWD//$HOME/~}%{$reset_color%}'
