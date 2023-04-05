#!/bin/bash
source col.conf
declare -a array_color=()
declare -a array_numb=()
declare -a color=()
default=(0 0 0 0)
declare -a default_col=()
default_col=(normal normal normal normal)
count=0
colors=(white red green blue purple black)

black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
purple='\033[0;35m'
blue='\033[0;34m'


fin="\033[0m"
white_back='\033[47m'
red_back='\033[41m'
green_back='\033[42m'
blue_back='\033[44m'
purple_back='\033[45m'
black_back='\033[40m'


export column1_background1=$column1_background
export column1_font_color1=$column1_font_color
export column2_background2=$column2_background
export column2_font_color2=$column2_font_color

if [ -z ${column1_background1} ] || [[ ${column1_background1} != [1-6] ]] || [[ ${column1_background1} == ${column1_font_color1} ]]; then 
    column1_background1=2
    default[0]=1
    default_col[0]='red'
fi
array_numb[0]=$column1_background1

export column1_font_color1=$column1_font_color
if [ -z ${column1_font_color1} ] || [[ ${column1_font_color1} != [1-6] ]]; then 
    column1_font_color1=1
    default[1]=1
    default_col[1]='white'
fi
array_numb[1]=$column1_font_color1

if [ -z ${column2_background2} ] || [[ ${column2_background2} != [1-6] ]] || [[ ${column2_background2} == ${column2_font_color2} ]] ; then 
    column2_background2=3
    default[2]=1
    default_col[2]='green'
fi
array_numb[2]=$column2_background2

if [ -z ${column2_font_color2} ] || [[ ${column2_font_color2} != [1-6] ]]; then 
    column2_font_color2=6
    default[3]=1
    default_col[3]='black'
fi
array_numb[3]=$column2_font_color2

echo "${default_col[@]}"

for i in "${array_numb[@]}";
do
    if [ $count -eq 1 ] || [ $count -eq 3 ] ; then
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

echo -e "${array_color[1]}${array_color[0]}HOSTNAME $fin      = ${array_color[3]}${array_color[2]}$HOSTNAME $fin"
echo -e "${array_color[1]}${array_color[0]}TIMEZONE$fin        = ${array_color[3]}${array_color[2]}$TIMEZONE $fin"
echo -e "${array_color[1]}${array_color[0]}OS$fin              = ${array_color[3]}${array_color[2]}$OS $fin"
echo -e "${array_color[1]}${array_color[0]}DATE$fin            = ${array_color[3]}${array_color[2]}$DATE $fin"
echo -e "${array_color[1]}${array_color[0]}UPTIME$fin          = ${array_color[3]}${array_color[2]}$UPTIME $fin"
echo -e "${array_color[1]}${array_color[0]}UPTIME_SEC$fin      = ${array_color[3]}${array_color[2]}$UPTIME_SEC $fin"
echo -e "${array_color[1]}${array_color[0]}IP$fin              = ${array_color[3]}${array_color[2]}$IP $fin"
echo -e "${array_color[1]}${array_color[0]}MASK$fin            = ${array_color[3]}${array_color[2]}$MASK $fin"
echo -e "${array_color[1]}${array_color[0]}GATEWAY$fin         = ${array_color[3]}${array_color[2]}$GATEWAY $fin"
echo -e "${array_color[1]}${array_color[0]}RAM_TOTAL$fin       = ${array_color[3]}${array_color[2]}$RAM_TOTAL $fin"
echo -e "${array_color[1]}${array_color[0]}RAM_USED$fin        = ${array_color[3]}${array_color[2]}$RAM_USED $fin"
echo -e "${array_color[1]}${array_color[0]}RAM_FREE$fin        = ${array_color[3]}${array_color[2]}$RAM_FREE $fin"
echo -e "${array_color[1]}${array_color[0]}SPACE_ROOT$fin      = ${array_color[3]}${array_color[2]}$SPACE_ROOT $fin"
echo -e "${array_color[1]}${array_color[0]}SPACE_ROOT_USED$fin = ${array_color[3]}${array_color[2]}$SPACE_ROOT_USED $fin"
echo -e "${array_color[1]}${array_color[0]}SPACE_ROOT_USED$fin = ${array_color[3]}${array_color[2]}$SPACE_ROOT_USED$end $fin"

echo ""

names=(Column 1 background Column 2 background)
names_2=(Column 1 font color Column 2 font color)
k=0
k_2=0
j=0
for i in "${default[@]}";
do
if [ ${i} -ne 0 ]; then
    if [[ ${j} -eq 0 ]] || [[ ${j} -eq 2 ]]; then
        echo "${names[k]} ${names[k+1]} ${names[k+2]} = default (${default_col[j]})"
        k=$((k+3))
        j=$((j+1))
    else
        echo "${names_2[k_2]} ${names_2[k_2+1]} ${names_2[k_2+2]} ${names_2[k_2+3]} = default (${default_col[j]})"
        k_2=$((k_2+4))
        j=$((j+1))
    fi

else 
    if [[ ${j} -eq 0 ]] || [[ ${j} -eq 2 ]]; then
        echo "${names[k]} ${names[k+1]} ${names[k+2]} = ${array_numb[j]} (${colors[${array_numb[j]}-1]})"
        k=$((k+3))
        j=$((j+1))
    else
        echo "${names_2[k_2]} ${names_2[k_2+1]} ${names_2[k_2+2]} ${names_2[k_2+3]} = ${array_numb[j]} (${colors[${array_numb[j]}-1]}) "
        k_2=$((k_2+4))
        j=$((j+1))
    fi
fi
done
