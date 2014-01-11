source $COBBLER_HOME/core/colours.sh

_remote() {
    [[ ! -z $COBBLER_REMOTE ]] && {
	echo "${COLOUR_YELLOW}@${COBBLER_REMOTE}${COLOUR_RESET}"
    }
}
info() {
    echo "[${COLOUR_GREEN}info${COLOUR_RESET}]$(_remote) $@"
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
export -f info warn fail success _remote
