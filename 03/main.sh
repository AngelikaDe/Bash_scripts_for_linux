#!/bin/bash

declare -a array_color=()
count=0
fin="\033[0m"
re="^[0-9]+$"
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
purple='\033[0;35m'

white_back="\033[107m"
red_back="\033[101m"
green_back="\033[102m"
blue_back="\033[104m"
purple_back="\033[105m"
black_back="\033[40m"
source info.sh
chmod +x ./info.sh
./info.sh $1
# export $(cut -d= -f1 info.sh)

if [ $# != 4 ] 
then
echo "Not enough arguments/to many. Plese enter 4 arguments and call the script again"
exit 0
fi
for var in "$1" "$2" "$3" "$4"
do
    if [[ $var != [1-6] ]];
    then
    echo "Please, enter all numbers and call the script again"
    exit 0
    fi
done
if [ $1 -eq $2 ] ; then
    echo "Please, enter different numbers and call the script again"
elif [ $3 -eq $4 ] ; then
    echo "Please, enter different numbers and call the script again"
fi

for var in "$@"
do
    if [ $count -eq 0 ] || [ $count -eq 2 ] ; then
        case "$var" in
        1) array_color+=( "$white" )
            ;;
        2) array_color+=( "$red" )
            ;;
        3) array_color+=( "$green" )
            ;;
        4) array_color+=( "$blue" )
            ;;
        5) array_color+=( "$purple" )
            ;;
        6) array_color+=( "$black" )
            ;;
        *) echo "UNKNOWN OPTION ${var}. End. Try again"
            exit 0
            ;;
        esac
    else 
        case "$var" in
         1) array_color+=( "$white_back" )
            ;;
        2) array_color+=( "$red_back" )
            ;;
        3) array_color+=( "$green_back" )
            ;;
        4) array_color+=( "$blue_back" )
            ;;
        5) array_color+=( "$purple_back" )
            ;;
        6) array_color+=( "$black_back" )
            ;;
        *) echo "UNKNOWN OPTION ${var}. End. Try again"
            exit 0
            ;;
        esac
    fi
    count=$((count+1))
done

echo -e "${array_color[0]}${array_color[1]}HOSTNAME$fin        = ${array_color[2]}${array_color[3]}$HOSTNAME $fin"
echo -e "${array_color[0]}${array_color[1]}TIMEZONE$fin        = ${array_color[2]}${array_color[3]}$TIMEZONE $fin"
echo -e "${array_color[0]}${array_color[1]}OS$fin              = ${array_color[2]}${array_color[3]}$OS $fin"
echo -e "${array_color[0]}${array_color[1]}DATE$fin            = ${array_color[2]}${array_color[3]}$DATE $fin"
echo -e "${array_color[0]}${array_color[1]}UPTIME$fin          = ${array_color[2]}${array_color[3]}$UPTIME $fin"
echo -e "${array_color[0]}${array_color[1]}UPTIME_SEC$fin      = ${array_color[2]}${array_color[3]}$UPTIME_SEC $fin"
echo -e "${array_color[0]}${array_color[1]}IP$fin              = ${array_color[2]}${array_color[3]}$IP $fin"
echo -e "${array_color[0]}${array_color[1]}MASK$fin            = ${array_color[2]}${array_color[3]}$MASK $fin"
echo -e "${array_color[0]}${array_color[1]}GATEWAY$fin         = ${array_color[2]}${array_color[3]}$GATEWAY $fin"
echo -e "${array_color[0]}${array_color[1]}RAM_TOTAL$fin       = ${array_color[2]}${array_color[3]}$RAM_TOTAL $fin"
echo -e "${array_color[0]}${array_color[1]}RAM_USED$fin        = ${array_color[2]}${array_color[3]}$RAM_USED $fin"
echo -e "${array_color[0]}${array_color[1]}RAM_FREE$fin        = ${array_color[2]}${array_color[3]}$RAM_FREE $fin"
echo -e "${array_color[0]}${array_color[1]}SPACE_ROOT$fin      = ${array_color[2]}${array_color[3]}$SPACE_ROOT $fin"
echo -e "${array_color[0]}${array_color[1]}SPACE_ROOT_USED$fin = ${array_color[2]}${array_color[3]}$SPACE_ROOT_USED $fin"
echo -e "${array_color[0]}${array_color[1]}SPACE_ROOT_FREE$fin = ${array_color[2]}${array_color[3]}$SPACE_ROOT_USED$end $fin"
