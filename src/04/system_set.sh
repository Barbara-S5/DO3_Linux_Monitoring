#!/bin/bash

source ./color_set.sh
source ./col_config.conf

default_column1_background=4
default_column1_font_color=6
default_column2_background=1
default_column2_font_color=2

column1_background=${column1_background_l:-$default_column1_background}
column1_font_color=${column1_font_color_l:-$default_column1_font_color}
column2_background=${column2_background_r:-$default_column2_background}
column2_font_color=${column2_font_color_r:-$default_column2_font_color}

n_b=$(func_col "$column1_background")
n_sh=$(func_text_col "$column1_font_color")
ec_b=$(func_col "$column2_background")
ec_sh=$(func_text_col "$column2_font_color")

null_col="\033[0m"

is_default1_bg=$([ -z "$column1_background_l" ] && echo "default" || echo "$column1_background")
is_default1_font=$([ -z "$column1_font_color_l" ] && echo "default" || echo "$column1_font_color")
is_default2_bg=$([ -z "$column2_background_r" ] && echo "default" || echo "$column2_background")
is_default2_font=$([ -z "$column2_font_color_r" ] && echo "default" || echo "$column2_font_color")

func_info(){
    echo -e "${n_b}${n_sh}HOSTNAME${null_col} =" ${ec_b}${ec_sh}$HOSTNAME${null_col}
    echo -e "${n_b}${n_sh}TIMEZONE${null_col} =" ${ec_b}${ec_sh}$(timedatectl show --property=Timezone --value) "UTC" $(date +%z | sed 's/\([+-]\{0,1\}.\{2\}\).*/\1/' | sed 's/^+0/+/; s/^-0/-/')${null_col}
    echo -e "${n_b}${n_sh}USER${null_col} =" ${ec_b}${ec_sh}$USER${null_col}${null_col}
    echo -e "${n_b}${n_sh}OS${null_col} =" ${ec_b}${ec_sh}$(cat /etc/issue)${null_col}
    echo -e "${n_b}${n_sh}DATE${null_col} =" ${ec_b}${ec_sh}$(date +'%d %B %Y %R:%S')${null_col}
    echo -e "${n_b}${n_sh}UPTIME${null_col} =" ${ec_b}${ec_sh}$(uptime -p | sed 's/up //')${null_col}
    echo -e "${n_b}${n_sh}UPTIME_SEC${null_col} = ${ec_b}${ec_sh}$(awk '{print $1}' /proc/uptime) seconds${null_col}"
    echo -e "${n_b}${n_sh}IP${null_col} =" ${ec_b}${ec_sh}$(hostname -I | awk '{print $1}' | sed -n '1p')${null_col}
    echo -e "${n_b}${n_sh}MASK${null_col} =" ${ec_b}${ec_sh}$(ifconfig | grep -w "inet" | awk '{print $4}' | sed -n '1p')${null_col}  
    echo -e "${n_b}${n_sh}GATEWAY${null_col} =" ${ec_b}${ec_sh}$(ip route | grep 'default via' | awk '{print $3}' | sed -n '1p')${null_col}
    echo -e "${n_b}${n_sh}RAM_TOTAL${null_col} =" ${ec_b}${ec_sh}$(vmstat -s | grep 'total memory' | awk '{printf "%.3f GB", $1/1048576}')${null_col}
    echo -e "${n_b}${n_sh}RAM_USED${null_col} =" ${ec_b}${ec_sh}$(vmstat -s | grep 'used memory' | awk '{printf "%.3f GB", $1/1048576}')${null_col}
    echo -e "${n_b}${n_sh}RAM_FREE${null_col} =" ${ec_b}${ec_sh}$(vmstat -s | grep 'free memory' | awk '{printf "%.3f GB", $1/1048576}')${null_col}
    echo -e "${n_b}${n_sh}SPACE_ROOT${null_col} =" ${ec_b}${ec_sh}$(df -m / | grep '/dev/' | awk '{printf "%.2f M", $2}')${null_col}
    echo -e "${n_b}${n_sh}SPACE_ROOT_USED${null_col} =" ${ec_b}${ec_sh}$(df -m / | grep '/dev/' | awk '{printf "%.2f M", $3}')${null_col}
    echo -e "${n_b}${n_sh}SPACE_ROOT_FREE${null_col} =" ${ec_b}${ec_sh}$(df -m / | grep '/dev/' | awk '{printf "%.2f M", $2}')${null_col}

    echo "Column 1 background = ${is_default1_bg} ($(get_color_name "$column1_background"))"
    echo "Column 1 font color = ${is_default1_font} ($(get_color_name "$column1_font_color"))"
    echo "Column 2 background = ${is_default2_bg} ($(get_color_name "$column2_background"))"    
    echo "Column 2 font color = ${is_default2_font} ($(get_color_name "$column2_font_color"))"
}