source $COBBLER_HOME/core/colours.sh
info() {
    echo "[${COLOUR_GREEN}info${COLOUR_RESET}] $@"
}
warn() {
    echo "[${COLOUR_ORANGE}warn${COLOUR_RESET}] $@"
}
fail() {
    echo "[${COLOUR_RED}fail${COLOUR_RESET}] $@"
}
success() {
    echo "[${COLOUR_GREEN} ok ${COLOUR_RESET}] $@"
}
export -f info warn fail success
