#!/bin/bash
#array_color=()
fin="\033[0m"
re='^[0-9]+$'
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

if [ $# != 4 ] 
then
echo "Not enough arguments/to many. Plese enter 4 arguments and call the script again"
exit 0
fi
for var in "$@"
do
    if ! [[ $var =~ $re ]] ; then
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
        4) array_color+=( "$blue" );
            ;;
        5) array_color+=( "$purple" );
            ;;
        6) array_color+=( "$black" );
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
        4) array_color+=( "$blue_back" );
            ;;
        5) array_color+=( "$purple_back" );
            ;;
        6) array_color+=( "$black_back" );
            ;;
        *) echo "UNKNOWN OPTION ${var}. End. Try again"
            exit 0
            ;;
        esac
    fi
    count=$((count+1))
done
# echo "${array_color[*]}"
# echo "${array_color[0]}${array_color[1]}HENLO $end=${array_color[2]}${array_color[3]} MY$end"
# # echo "${array_color[*]}"
# # echo "${BLACK}I like bash"
# echo "NOOOO it is the worst"
echo "$(sh info.sh)"