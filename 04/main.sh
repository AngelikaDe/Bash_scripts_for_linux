#!/bin/bash
source col.conf
declare -a array_color=()
declare -a array_numb=()
count=0

array_name_colors=(black white red green purple)
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
export $(cut -d= -f1 info.sh)

export column1_background1=$column1_background
if [ -z ${column1_background1} ]; then 
    column1_background1=2
fi
array_numb[0]=$column1_background1

export column1_font_color1=$column1_font_color
if [ -z ${column1_font_color1} ]; then 
    column1_font_color1=2
fi
array_numb[1]=$column1_font_color1

export column2_background2=$column2_background
if [ -z ${column2_background2} ]; then 
    column2_background2=2
fi
array_numb[2]=$column2_background2

export column2_font_color2=$column2_font_color
if [ -z ${column2_font_color2} ]; then 
    column2_font_color2=2
fi
array_numb[3]=$column2_font_color2

# echo "${array_numb[@]}"

# echo "${array_numb[2]}"
# echo "${array_numb[3]}"

for i in "${array_numb[@]}"
do
    if [ $count -eq 0 ] || [ $count -eq 2 ] ; then
        case "$i" in
        1) array_color+=( "$white" )
            ;;
        2) array_color+=( "$red" )
            ;;
        3) array_color+=( "$green" )
            ;;
        4) array_color+=( "$blue" );
            ;;
        5) array_color+=( "$purple" )
            ;;
        6) array_color+=( "$black" )
            ;;
        *) echo "UNKNOWN OPTION ${array_numb[i]}. End. Try again"
            exit 0
            ;;
        esac
    else 
        case "$i" in
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
        *) echo "UNKNOWN OPTION ${i}. End. Try again"
            exit 0
            ;;
        esac
    fi
    count=$((count+1))
done
# echo "${array_name_colors[2]}"
# echo "${array_numb[@]}"
echo ""
color_1=${array_numb[0]}
color_2=${array_numb[1]}
color_3=${array_numb[2]}
color_4=${array_numb[3]}

# echo "Column 1 background = ${array_numb[0]} ("${array_name_color[$color_1]}")"
# echo "YEES ${array_name_colors[$color_1]}"
# # echo "The value of the test variable is: ${column1_background}"
# # echo "${array_color[0]}${array_color[1]}HENLO $end=${array_color[2]}${array_color[3]} MY$end"
# # echo "NOOOO it is the worst"

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
echo -e "${array_color[0]}${array_color[1]}SPACE_ROOT_USED$fin = ${array_color[2]}${array_color[3]}$SPACE_ROOT_USED$end $fin"
