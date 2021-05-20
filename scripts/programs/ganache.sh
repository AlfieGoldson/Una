#!/bin/bash

echo "Starting AppImage download"

curl -s -L https://api.github.com/repos/trufflesuite/ganache/releases/latest \
    | grep -E 'browser_download_url' \
    | grep linux-x86_64 \
    | cut -d '"' -f 4 \
    | wget -qi - -O ganache.AppImage

echo "Downloaded AppImage"

chmod u+x ganache.AppImage

echo "Extracting AppImage..."

sudo ./ganache.AppImage --appimage-extract

echo "AppImage Extracted -> ./squashfs-root"


DEST="$HOME/bin/ganache"
DATE=$(date +%Y-%m-%d-%H%M)

echo $DEST

if [ -d $DEST ]; then
    echo "Backing up existing Directory\n    \e[90m$DEST -> $DEST.$DATE\e[39m"
    mv $DEST "$DEST.$DATE"
fi

sudo mv ./squashfs-root $DEST

sudo rm ganache.AppImage

echo "Ganache Installed!"