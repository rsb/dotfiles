#!/usr/bin/env zsh

log_file=~/.dotfiles/pkg/linux/install.log

if [[ ! -e "$log_file" ]]; then
  echo "Creating install log at $log_file"
  touch "$log_file"
fi

sudo apt-get -y install zsh zsh-common zsh-syntax-highlighting zsh-autosuggestions
if type -p zsh > /dev/null; then
  echo "zsh Installed" >> $log_file
else
 echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

if [ ! command -v starship  &> /dev/null ]; then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
else
 echo "starship is already installed ($(which starship))"  
fi

if [ ! type zplug &> /dev/null ]; then
  echo "zplug is not installed. installing now ..."
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else
 echo "zplug is already installed"  
fi



sudo apt-get -y install httpie exa jq

