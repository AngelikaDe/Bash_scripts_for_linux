#!/bin/bash
echo "HENLOOOO"
"HOSTNAME =  $hostname"
"TIMEZONE = " $timedatectl|grep“Time zone”
"USER = " $whoami
"OS = " $cat/etc/issue
"DATE = " $(date '+%Y-%m-%d %H:%M:%S'
"UPTIME = "$uptime -p
"UPTIME_SEC = "$awk '{print $1}' /proc/uptime
"IP= " $hostname -I
"MASK =" $ifconfig | grep -i mask
"GATEWAY = " $ip route | grep default 
