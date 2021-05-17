#!/bin/bash

sudo apt update

install() {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "\e[37m$1\e[39m is Already Installed"
  fi
}

# Basics
install chromium-browser
install curl
install git
install openvpn
install vim
