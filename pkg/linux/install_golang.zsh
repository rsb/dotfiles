#!/usr/bin/env zsh

GOLANG_VERSION="1.16.5"
GOLANG_TAR="go${GOLANG_VERSION}.linux-amd64.tar.gz"
GOLANG_URL="https://golang.org/dl/${GOLANG_TAR}"

if [ ! -d /usr/local/go  &>/dev/null ]; then
  wget $GOLANG_URL
  sudo tar -C /usr/local -xzf $GOLANG_TAR
  rm $GOLANG_TAR
else
 echo "go is already installed ($(which go))"
fi
