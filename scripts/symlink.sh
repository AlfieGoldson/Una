#!/bin/bash

cd ..

BASE_DIR=$(pwd)

$title "Symbolic Links"

linkFile() {
  ORIGIN=$1
  DEST=$2
  DATE=$(date +%Y-%m-%d-%H%M)

  $subtitle $ORIGIN

  if [ -L "$DEST" ]; then
    rm $DEST
    $success "Removed Existing Symlink:" $DEST

  elif [ -f "$DEST" ]; then
    mv $DEST "$DEST.$DATE"
    $success "Backed Up Existing File:" "$DEST -> $DEST.$DATE"

  elif [ -d "$DEST" ]; then
    mv $DEST "$DEST.$DATE"
    $success "Backed Up Existing Directory:" "$DEST -> $DEST.$DATE"
  fi
  
  ln -s "$BASE_DIR/$ORIGIN" "$DEST"
  
  $success "Created New Symlink:" "$ORIGIN -> $DEST"
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