PROMPT='$(virtualenv_prompt_info)'
PROMPT+="%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
# PROMPT+="
# %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )"
PROMPT+="
%(?:%{$fg_bold[green]%}%1{$%} :%{$fg_bold[red]%}%1{$%} )"

ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[yellow]%}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
