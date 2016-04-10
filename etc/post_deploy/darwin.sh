#! /usr/bin/env bash

desktop() {
    services=(
	com.apple.mDNSResponder.plist
	com.apple.mDNSResponderHelper.plist
	com.apple.dashboard.advisory.fetch.plist
	com.apple.UserNotificationCenter.plist
	com.apple.RemoteDesktop.PrivilegeProxy.plist
	com.apple.IIDCAssistant.plist
	com.apple.blued.plist
    )

    for s in ${services[@]}; do
	launchctl unload -w $s
    done
}

export -f desktop
