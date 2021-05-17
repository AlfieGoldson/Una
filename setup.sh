#!/bin/bash

cd scripts

sudo sh ./apt-install.sh
sudo sh ./programs.sh
sudo sh ./symlink.sh

# Get all upgrades
sudo apt upgrade -y

echo 'YOOOOO'