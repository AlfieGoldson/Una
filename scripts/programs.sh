#!/bin/bash

$title "Programs"

echo "Creating tmp directory (~/tmp)"

mkdir -p ~/tmp
cd ~/tmp

cd programs

sh ./oh-my-zsh.sh
sh ./node.sh
sh ./deno.sh
sh ./ganache.sh