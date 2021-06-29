local LC_ALL="" LC_CTYPE="en_US.UTF-8"

#Load Colors
load_colors() {
  autoload colors && colors
  for color in red green yellow blue magenta cyan black white; do
      eval $color='%F{$color}'
      eval bg_$color='%K{$color}'
  done
  eval reset_fg='%f'
  eval reset_bg='%k'
  eval reset_colors='%f%k'
}

prompt_end() {
  echo -n "$reset_colors › "
}

prompt_user() {
    echo -n $yellow
    echo -n "%n@%m"
}

prompt_dir() {
  echo -n $white
  echo -n "  $black↳$reset_colors %~"
}

prompt_time() {
  echo -n "$blue :: $reset_colors"
  echo -n $reset_colors
  echo -n "📅 $(date +%d/%m/%y)"
  echo -n "$blue :: $reset_colors"
  echo -n "⏰ $(date +%H:%M:%S)"
}

prompt_return_status() {
  RPROMPT='%(?.✔.%{$fg[red]%}✘%f)'
}

prompt_git() {
  setopt prompt_subst
  autoload -Uz vcs_info

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "$green✚"
  zstyle ':vcs_info:git:*' unstagedstr "$yellow●"
  zstyle ':vcs_info:*' formats "$blue :: $reset_colors › $black(%s)$reset_colors %b%u%c"
  vcs_info

  echo -n ${vcs_info_msg_0_}$reset_colors
}

# local NODEPKG_PATH="${UNA_PATH}/plugins/nodepkg/nodepkg"

prompt_node() {
  PCKG_JSON="$(pwd)/package.json"
  if [ ! -f "$PCKG_JSON" ]; then
    return
  fi
  echo -n "  $black↳ (nvm)$reset_colors node $green$(node -v)$reset_colors"
  # echo $NODEPKG_PATH
  # $NODEPKG_PATH
  # if [ ! -f "$NODEPKG_PATH" ]; then
  #   # chmod u+x $NODEPKG_PATH
  #   return
  # fi
  # $NODEPKG_PATH
  
}

build_prompt() {
  load_colors
  RETVAL=$?
  echo -n "$black($reset_fg"
  # echo -n "$green⎛ $reset_fg"
  prompt_user
  prompt_time
  prompt_git
  # echo -n "$green⎝ $reset_fg"
  echo "$black)$reset_fg"
  prompt_node
  echo
  prompt_dir
  prompt_end
}

PROMPT='$(build_prompt)'
RPROMPT='%(?.✔.%{$fg[red]%}✘%f)'