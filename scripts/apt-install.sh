#!/bin/bash

$title "Apt Install"

install() {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    $info "Installing $1"
    sudo apt install -y $1
    $success "Sucessfully Installed $1" $(which $1)
  else
    $info $1 "Already Installed"
  fi
}

# Basics
install chromium-browser
install curl
install git
install openvpn
install vim
