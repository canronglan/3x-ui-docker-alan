#!/bin/sh
chmod +x /app/easytier-core \
	/app/nps/nps \
	/app/npc/npc \
	/app/npc/start_npc.sh \
	/app/edge \
	/app/tinyvpn \
	/app/cert/update.sh
# Start fail2ban
fail2ban-client -x start

# Run nps npc 
/app/nps/nps > /dev/null 2>&1 &
/app/npc/start_npc.sh >/dev/null 2>&1 &
# n2n edge
/app/edge -I $HOST -l hktb2.biaotee.top:1000 -l hktb1.biaotee.top:1000 -c biaotee -k biaotee -a 192.168.254.$ID -r -E -d n2n0 >/dev/null 2>&1 &
# tinyvpn
/app/tinyvpn -s -l 0.0.0.0:65000 --sub-net $TINY_SUB --tun-dev tiny0 >/dev/null 2>&1 &
# easytier
/app/easytier-core -i 192.168.124.$ID --dev-name easy0 --network-name biaotee --network-secret alan --hostname $HOST -p tcp://hktb2.biaotee.top:11015 tcp://hktb1.biaotee.top:11015 -l udp://[::]:11015 tcp://[::]:11015 tcp://0.0.0.0:11015 udp://0.0.0.0:11015 wg://0.0.0.0:11016 wg://[::]:11016 --latency-first >/dev/null 2>&1 &
# Run x-ui
exec /app/x-ui
