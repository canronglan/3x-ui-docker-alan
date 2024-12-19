mkdir -p /root/cert
wget -O $(dirname $(realpath "$0"))/fullchain.pem http://hktb2.biaotee.top/cert/fullchain.pem > /dev/null 2>&1 &
wget -O $(dirname $(realpath "$0"))/privkey.pem http://hktb2.biaotee.top/cert/privkey.pem > /dev/null 2>&1 &
