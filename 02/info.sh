#!/bin/bash
echo "HOSTNAME = $(hostname | awk '{print $0}')"
echo "TIMEZONE = $(timedatectl | grep 'Time zone' | awk '{print $3 $4 $5}')"
echo "USER = $(whoami | awk '{print $0}')"
echo "OS = $(cat /etc/issue | awk '{print $1 $2 $3}')"
echo "DATE = $(date '+%Y-%m-%d %H:%M:%S')"
echo "UPTIME = $(uptime -p | awk '{print $2 $3 $4 $5}')"
echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
echo "IP = $(hostname -I | awk '{print $0}')"
echo "MASK = $(ifconfig | grep mask | head -n 1 | awk '{print $4}')"
echo "GATEWAY =  $(ip route | grep default | awk '{print $3}')"
echo "RAM_TOTAL =  $(free -m | grep Mem | awk '{printf "%.3fGb\n", $2/1024}')"
echo "RAM_USED =  $(free -m | grep Mem | awk '{printf "%.3fGb\n", $3/1024}')"
echo "RAM_FREE =  $(free -m | grep Mem | awk '{printf "%.3fGb\n", $4/1024}')"
echo "SPACE_ROOT = $(df /root/ | tail -n 1 | awk '{printf "%.2fMb\n", $2/1024}')"
echo "SPACE_ROOT_USED = $(df /root/ | tail -n 1 | awk '{printf "%.2fMb\n", $3/1024}')"
echo "SPACE_ROOT_USED = $(df /root/ | tail -n 1 | awk '{printf "%.2fMb\n", $4/1024}')"