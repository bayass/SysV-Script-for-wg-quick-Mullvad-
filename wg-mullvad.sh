#!/bin/sh

### BEGIN INIT INFO
# Provides:          wireguard-br-sao-wg-001
# Required-Start:    $network $syslog
# Required-Stop:     $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Bring up WireGuard VPN connection
# Description:       This script brings up the WireGuard VPN connection 
### END INIT INFO

# Change the following path to the location of wg-quick on your system
WG_QUICK="/usr/bin/wg-quick"
WG_INTERFACE="YOUR-SERVER-GOES-HERE"

start() {
    sleep 2
    echo "Starting WireGuard VPN connection..."
    $WG_QUICK up $WG_INTERFACE
}

stop() {
    echo "Stopping WireGuard VPN connection..."
    $WG_QUICK down $WG_INTERFACE
}

restart() {
    stop
    start
}

status() {
    $WG_QUICK status $WG_INTERFACE
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

exit 0
