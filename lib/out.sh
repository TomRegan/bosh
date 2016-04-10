source $BOSH_HOME/lib/colours.sh

_remote() {
    [[ ! -z $BOSH_REMOTE ]] && {
        echo "${COLOUR_YELLOW}@${BOSH_REMOTE}${COLOUR_RESET}"
    }
}
info() {
    echo "[${COLOUR_BLUE}info${COLOUR_RESET}]$(_remote) $@"
}
warn() {
    echo "[${COLOUR_ORANGE}warn${COLOUR_RESET}]$(_remote) $@"
}
fail() {
    echo "[${COLOUR_RED}fail${COLOUR_RESET}]$(_remote) $@"
}
success() {
    echo "[${COLOUR_GREEN} ok ${COLOUR_RESET}]$(_remote) $@"
}
skip() {
    echo "[${COLOUR_YELLOW}skip${COLOUR_RESET}]$(_remote) $@"
}
export -f info warn fail success skip _remote
