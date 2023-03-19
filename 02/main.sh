#!/bin/bash

choice="y|Y"
if [ "$#" -lt 0 ]
then 
echo "error. exit"
exit 1
fi

echo "$(sh info.sh)"

file_name="$(date "+%d_%m_%Y_%H_%M_%S").ststus" 
read -p "Do you want to save the information? [Y/N]" choice
	if [[ $choice = y ]] || [[ $choice = Y ]] 
		then
		# echo "YAAAS"
		# chmod 777 main_2.sh
		#./main_2.sh 1> $file_name
		exec 1> $file_name
		echo "$(sh main_2.sh)" >&1
	fi
