#! /usr/bin/env bash

update() {
    info "Flushing existing firewall rules"
    iptables -F
}

_apply() {
    local directive=$@
    iptables-save | grep -i -- "$directive" 2>&1 >/dev/null && {
	skip "Firewall rule already exists: '$directive'"
	return
    }
    iptables ${directive[@]} || {
	warn "An error occurred processing the rule '$directive'"
	[ $? -eq 2 ] && warn "Reason: bad command"
	[ $? -eq 1 ] && warn "Reason: unknown"
    }
}

natforward() {
    info "Enabling NAT forwarding for $1"
    grep 1 /proc/sys/net/ipv4/ip_forward 2>&1 > /dev/null  && {
	skip "NAT forwarding is already enabled"
    } || {
	echo 1 > /proc/sys/net/ipv4/ip_forward
    }
    local directive=( -t nat -A POSTROUTING -s $1 -o eth0 -j MASQUERADE )
    _apply ${directive[@]}
}

_allow_interface() {
    local interface=$1
    info "Updating firewall to allow all traffic to $interface"
    local directive=( -A INPUT -i $1 -j ACCEPT )
    _apply ${directive[@]}
}

_allow_established() {
    info "Updating firewall to allow established connections"
    local directive=( -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT )
    _apply ${directive[@]}
}

allow() {
    local type=$1
    [[ $type == interface ]] && {
	shift
	_allow_interface $@
	return
    }
    [[ $type == established ]] && {
	shift
	_allow_established $@
	return
    }
    local proto=$1
    local dport=$2
    local limit=$3
    local tries=$4
    local seconds=$5
    info "Updating firewall to allow $proto connections to port $dport"
    [ ! -z $limit ] && {
	info "└── limiting rate to $tries connections every $seconds seconds"
	local directive_a=( -A INPUT -p $proto -m $proto --dport $dport -m state --state NEW -m recent --set --name DEFAULT --rsource )
	_apply ${directive_a[@]}
	local directive_b=( -A INPUT -p $proto -m $proto --dport $dport -m state --state NEW -m recent --update --seconds $seconds --hitcount $tries --name DEFAULT --rsource -j DROP )
	_apply ${directive_b[@]}
    }
    local directive=( -A INPUT -p $proto -m state --state NEW -m $proto --dport $dport -j ACCEPT  )
    _apply ${directive[@]}
}

drop() {
    local type=$1
    [[ $type == "ping" ]] && {
	info "Updating firewall to drop pings"
	local directive=( -A INPUT -p icmp -m icmp --icmp-type 8 -j DROP )
	_apply ${directive[@]}
	return
    }
    [[ $type == all ]] && {
	shift
	local chain=$1
	local CHAIN=$(echo $chain | tr a-z A-Z)
	_allow_established
	info "Updating firewall policy to drop all $chain"
	local directive=( -P $CHAIN DROP  )
	_apply ${directive[@]}
    }
}

export -f allow drop natforward update
# private
export -f _allow_interface _allow_established _apply
