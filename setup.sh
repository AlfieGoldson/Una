#!/bin/bash

export log="sh $(pwd)/log.sh"
export title="$log TITLE"
export subtitle="$log SUBTITLE"
export success="$log SUCCESS"
export warning="$log WARNING"
export error="$log ERROR"
export info="$log INFO"

$title title
$subtitle subtitle
$success success info
$warning warning info
$error error info
$info info info

cd scripts

sudo apt update

sh ./apt-install.sh
sh ./programs.sh
sh ./symlink.sh

# Get all upgrades
sudo apt upgrade -y

$title 'YAY!'