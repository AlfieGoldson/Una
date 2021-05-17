TYPE=$1
TITLE=$2
CONTENT=$3

min() {
    return 
}

log() {
    TITLE_COLOR=$1
    CONTENT_COLOR=$2
    ICON=$3
    
    echo "${ICON} ${TITLE_COLOR}${TITLE}\n    \e[39m↳ ${CONTENT_COLOR}${CONTENT}\e[39m"
}

logTitle() {
    echo
    echo "\e[4m\e[1m$TITLE\e[24m"
    echo
}

case $TYPE in
"SUCCESS")
    log "\e[92m" "\e[90m" ✔️
    ;;
"WARNING")
    log "\e[93m" "\e[90m" ⚠️
    ;;
"ERROR")
    log "\e[91m" "\e[90m" 🛑
    ;;
"INFO")
    log "\e[39m" "\e[90m" ℹ️
    ;;
"SUBTITLE")
    echo "\e[94m$TITLE\e[39m"
    ;;
"TITLE")
    logTitle
    ;;
*)
    log "\e[39m" "\e[90m"
    ;;
esac