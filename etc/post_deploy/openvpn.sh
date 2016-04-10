#! /usr/bin/env base

server() {
    require root
    OUTPUT_PATH=/etc/openvpn/server.conf
    [[ -f $OUTPUT_PATH ]] && {
	warn "$OUTPUT_PATH already exists"
	cp $OUTPUT_PATH $OUTPUT_PATH.bak
	warn "Created a backup: $OUTPUT_PATH.bak"
    }
    info "Writing $OUTPUT_PATH"
    cat > $OUTPUT_PATH <<EOF
;;; Written by Bosh on $(date -u)
port 1194
proto udp
dev tun
;;; ensure PKI files are copied and the following details are correct
ca ca.crt
cert $(hostname).crt
key $(hostname).key
dh dh1024.pem
;;; ensure the above lines are correct
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
keepalive 10 120
comp-lzo
persist-key
persist-tun
status openvpn-status.log
verb 3
EOF
    info "Now copy PKI files to /etc/openvpn and edit $OUTPUT_PATH"
}

client() {
    fail "Client configuraton is not implemented"
}
