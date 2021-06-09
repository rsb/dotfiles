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

if [ ! -f /usr/local/bin/nvim ]; then
  echo "nvim is not installed. installing now ..."
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod 755 nvim.appimage
  sudo mv nvim.appimage /usr/local/bin/nvim
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt-get -y install httpie exa jq bat fd-find ripgrep

