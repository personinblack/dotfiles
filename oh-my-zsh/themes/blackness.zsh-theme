precmd() {
    echo
}

PROMPT='%{$fg_bold[red]%}_> %{$reset_color%}'
RPROMPT='%{$fg_bold[cyan]%}$(git_prompt_info) @ ${PWD//$HOME/~}%{$reset_color%}'
