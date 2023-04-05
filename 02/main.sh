#!/bin/bash

choice="y|Y"
if [ "$#" -lt 0 ]
then 
echo "error. exit"
exit 1
fi
chmod +x ./info.sh
./info.sh
file_name="$(date "+%d_%m_%Y_%H_%M_%S").status" 
read -p "Do you want to save the information? [Y/N]" choice
	if [ $choice = y ] || [ $choice = Y ] 
		then
		./info.sh >$file_name
	fi