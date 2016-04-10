install bootstrap

install openvpn
configure openvpn as server

configure firewall start update
configure firewall to allow interface lo
configure firewall to drop ping
configure firewall for natforward 10.8.0.0/24
configure firewall to allow tcp 22 limit 4 60
configure firewall to allow udp 1194
configure firewall to allow udp 60000:61000
configure firewall to drop all input
