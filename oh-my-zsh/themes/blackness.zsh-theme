precmd() {
    echo
    echo "┌] ${PWD//$HOME/~}"
}

PROMPT='└] $ '
RPROMPT='$(git_prompt_info)'

preexec() {
    echo
}
