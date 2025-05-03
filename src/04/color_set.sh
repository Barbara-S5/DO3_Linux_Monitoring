#!/bin/bash

source ./col_config.conf


func_col(){
    case "$1" in
        1) echo -e "\033[107m";;
        2) echo -e "\033[41m";;
        3) echo -e "\033[42m";;
        4) echo -e "\033[46m";;
        5) echo -e "\033[45m";;
        6) echo -e "\033[40m";;
        *) echo -e "default";;
    esac
}

func_text_col(){
    case "$1" in
        1) echo -e "\033[97m";;
        2) echo -e "\033[31m";;
        3) echo -e "\033[32m";;
        4) echo -e "\033[36m";;
        5) echo -e "\033[35m";;
        6) echo -e "\033[30m";;
        *) echo -e "default";;
    esac
}

get_color_name() {
    case "$1" in
        1) echo "white";;
        2) echo "red";;
        3) echo "green";;
        4) echo "blue";;
        5) echo "purple";;
        6) echo "black";;
        *) echo "default";;
    esac
}

# default_column1_background=4
# default_column1_font_color=6
# default_column2_background=5
# default_column2_font_color=6

# column1_background=${column1_background:-$default_column1_background}
# column1_font_color=${column1_font_color:-$default_column1_font_color}
# column2_background=${column2_background:-$default_column2_background}
# column2_font_color=${column2_font_color:-$default_column2_font_color}