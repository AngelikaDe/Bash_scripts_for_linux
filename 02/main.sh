#!/bin/bash

choice="y|Y"
if [ "$#" -lt 0 ]
then 
echo "error. exit"
exit 1
fi
chmod +x ./info.sh
./info.sh $1
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL"
echo "RAM_USED = $RAM_USED"
echo "RAM_FREE = $RAM_FREE"
echo "SPACE_ROOT = $SPACE_ROOT"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"


file_name="$(date "+%d_%m_%Y_%H_%M_%S").ststus" 
read -p "Do you want to save the information? [Y/N]" choice
	if [ $choice = y ] || [ $choice = Y ] 
		then
		exec 1> $file_name
		echo "$(sh info.sh)" >&1
	fi
