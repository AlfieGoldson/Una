export ZSH="/home/alfie/.oh-my-zsh"

# Theme
ZSH_THEME="una"

# Config
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git nvm)

# Aliases
alias exp="explorer.exe"
alias ch="ld /mnt/c/Users/Alfie/Documents/Projects/Corehalla/Corehalla\ Neue/monorepo"
alias moonshot="ld /mnt/c/Users/Alfie/Documents/Projects/Brawlhalla/moonshot"
alias raku="ld /mnt/c/Users/Alfie/Documents/Projects/Code/Raku"
alias vsproj="ld /mnt/c/users/Alfie/source/repos"
alias chc="ch && code ."
alias bfl="ld Documents/Projects/BFL/Website && code ."
alias c="clear"
alias c.="code ."
alias zc="code ~/.zshrc"
alias bfl="ld Documents/Projects/BFL"
alias raku="ld Documents/Projects/Code/Raku"
alias dock="sudo service docker start"
alias marc="make"

alias ganache="~/bin/ganache/AppRun"
alias twitch="~/bin/twitch_rig/AppRun"

# Functions
$ ld() { cd "$@" && ls --color=auto; }
$ ga() { git add "$@"; }
$ gs() { git status; }
$ gc() { git commit "$@"; }
$ gp() { git push; }

# Source
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(yarn global bin):$PATH"
export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0.0"
export LIBGL_ALWAYS_INDIRECT=1

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=true

cd ~