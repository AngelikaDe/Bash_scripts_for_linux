#!/bin/bash

re='^[0-9]+([.][0-9]+)?$'

if [ "$#" -eq 0 ]
then 
	echo "no arguments"
	exit 1
fi
if [ "$#" -gt 1 ]
then 
	echo "too many arguments"
	exit 1
fi

if [[ $1 =~ $re ]]; then
	echo "INCORRECT INPUT"
else
	echo $1
fi
