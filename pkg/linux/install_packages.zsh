#!/usr/bin/env zsh

log_file=~/.dotfiles/pkg/linux/install.log

if [[ ! -e "$log_file" ]]; then
  echo "Creating install log at $log_file"
  touch "$log_file"
fi

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
  echo "zsh Installed" >> $log_file
else
 echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi
