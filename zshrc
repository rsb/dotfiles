# Aliases
alias ll='ls -lAFh'

# Prompt
PROMPT='
%1~ %L %# '

RPROMPT='%*'


function mkcd() {
  mkdir -p "$@" && c "$_";
}
