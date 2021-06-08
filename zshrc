source ~/.shell/functions.zsh

if [ -f ~/.shell_local_before ]; then
  source ~/.shell_local_before
fi

if [ -f ~/.zshrc_local_before ]; then
  source ~/.zshrc_local_before
fi


source ~/.zsh/plugins_before.zsh
source ~/.zsh/settings.zsh


source ~/.shell/bootstrap.zsh
source ~/.shell/external.zsh
source ~/.shell/aliases.zsh

source ~/.zsh/prompt.zsh

source ~/.zsh/plugins_after.zsh

if [ -f ~/.shell_local_after ]; then
  source ~/.shell_local_after
fi

if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after
fi
