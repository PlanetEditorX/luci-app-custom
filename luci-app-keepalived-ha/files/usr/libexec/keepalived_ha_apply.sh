#!/bin/sh

. /lib/functions.sh

config_load keepalived_ha
config_get role config role
config_get vip config vip
config_get interface config interface
config_get peer_ip config peer_ip

mkdir -p /etc/keepalived

cat <<EOF > /etc/keepalived/keepalived.conf
vrrp_instance VI_1 {
    state ${role^^}
    interface $interface
    virtual_router_id 51
    priority $( [ "$role" = "main" ] && echo 100 || echo 50 )
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        $vip
    }
}
EOF

cat <<EOF > /etc/keepalived/failover_watchdog.sh
#!/bin/sh
VIP="$vip"
INTERFACE="$interface"
PEER_IP="$peer_ip"
LOG="/tmp/failover_watchdog.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] \$1" >> "\$LOG"
}

while true; do
    if ping -c 1 -W 1 "\$PEER_IP" >/dev/null 2>&1; then
        log "对端 \$PEER_IP 在线"
    else
        log "对端 \$PEER_IP 离线"
    fi
    sleep 3
done
EOF

chmod +x /etc/keepalived/failover_watchdog.sh
/etc/keepalived/failover_watchdog.sh &
