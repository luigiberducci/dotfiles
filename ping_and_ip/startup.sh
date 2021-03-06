#!/bin/bash
#
# IP=$(curl https://ping.eu | grep "Your IP is")
#
# telegram-send "IP_EXT:"
# telegram-send $IP
# IP_ADR=echo ${IP:14:15}
# telegram-send $IP_ADR
#
# LIP=$(ifconfig |grep "inet ")
# telegram-send "IP_INT:"
# telegram-send $LIP
# # echo ${LIP}
#
# # OUT=$IP_ADR,$LIP
# # telegram-send $OUT
#
PORT="99"
while [ 1 ]
do
    # sleep 2m #maybe obsolete
    # echo "running" > ~/Desktop/startup_log.txt
    TMP_PING=$(curl https://ping.eu | grep "Your IP is")
    PING=$(echo "$TMP_PING" | awk -v FS="(<b>|</b>)" '{print $2}')
    # echo $PING
    IP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
    WHO=$(whoami)
    HOST=$(hostname)
    # check if different from those in vodafone port forward and send only if it is
    telegram-send "WHOAMI: $WHO, HOST: $HOST"
    telegram-send $PING
    telegram-send $IP
    telegram-send "ssh $WHO@$PING -v -p $PORT"
    # echo $(date +%H:%M:%S)
    sleep 14400
done
# telegram-send "PING: $PING,  IP: $IP"
