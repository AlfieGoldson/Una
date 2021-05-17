#!/bin/bash

cd ..

DOTFILES_DIR=$(pwd)

linkFile() {
  ORIGIN=$1
  DEST=$2
  DATE=$(date +%Y-%m-%d-%H%M)

  echo "\e[94m$ORIGIN\e[39m"

  if [ -h ~/${1} ]; then
    # Existing symlink 
    rm $DEST
    echo "Removed Existing Symlink:\n    \e[90m$DEST\e[39m"

  elif [ -f "$DEST" ]; then
    # Existing file
    mv $DEST "$DEST.$DATE"
    echo "Backed Up Existing File:\n    \e[90m$DEST -> $DEST.$DATE\e[39m"

  elif [ -d "$DEST" ]; then
    # Existing dir
    echo "Backing up existing dir..."
    mv $DEST "$DEST.$DATE"
  fi
  
  sudo ln -s $DOTFILES_DIR/$ORIGIN $DEST
  
  echo "Created New Symlink:\n    \e[32m$ORIGIN -> $DEST\e[39m"
  echo
}

linkHomeFile() {
  linkFile $1 "$HOME/$1"
}

linkZshTheme() {
  THEME="$1.zsh-theme"
  linkFile "./themes/$THEME" "$HOME/.oh-my-zsh/custom/themes/$THEME"
}

linkHomeFile .bashrc
linkHomeFile .zshrc
linkHomeFile .gitconfig
linkZshTheme una