PROMPT='%{$FG[005]%}%2c:%f %{$reset_color%}'
RPROMPT='$(git_prompt_info) %{$reset_color%}%{$FG[006]%}%D{%L:%M} %D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[006]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" *%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
