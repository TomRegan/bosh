#! /usr/bin/env base

bridge() {
    require root
    OUTPUT_PATH=/etc/tor/torrc
    [[ -f $OUTPUT_PATH ]] && {
	warn "$OUTPUT_PATH already exists"
	cp $OUTPUT_PATH $OUTPUT_PATH.bak
	warn "Created a backup: $OUTPUT_PATH.bak"
    }
    info "Writing $OUTPUT_PATH"
    cat > $OUTPUT_PATH <<EOF
## Written by Bosh on $(date -u)
ControlPort 9051
ORPort 9001
Nickname $(uuidgen | cut -c 1-8)
## ~32GB/mo
RelayBandwidthRate 100 KB  # Throttle traffic to 100KB/s (800Kbps)
RelayBandwidthBurst 200 KB # But allow bursts up to 200KB/s (1600Kbps)
## ~6.5GB/mo
#RelayBandwidthRate 20 KB  # Throttle traffic to 20KB/s (200Kbps)
#RelayBandwidthBurst 40 KB # But allow bursts up to 40KB/s (400Kbps)
ExitPolicy reject *:* # no exits allowed
BridgeRelay 1
EOF
    info "Review $OUTPUT_PATH, then start tor with 'service tor start'"
}
