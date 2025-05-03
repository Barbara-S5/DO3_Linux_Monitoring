#!/bin/bash 

source ./color_set.sh
source ./system_set.sh

if [ -f config.conf ]; then
    source col_config.conf
fi

if ! [ $# -eq 0 ]; then
    echo "Script works without arguments"
    exit 1
fi

if ! [[ "$column1_background" =~ ^[1-6]$ ]] || ! [[ "$column1_font_color" =~ ^[1-6]$ ]] || \
   ! [[ "$column2_background" =~ ^[1-6]$ ]] || ! [[ "$column2_font_color" =~ ^[1-6]$ ]]; then
    echo "Parametrs should me numbers from 1 to 6"
    exit 1
fi

if [ "$column1_background" -eq "$column1_font_color" ] || [ "$column2_background" -eq "$column2_font_color" ]
then 
    echo "The backgrounds and fonts should be in different colors"
    echo "May be you should restart the program?"
    exit 1
fi

if [ -f system_set.sh ]; then 
    func_info
    exit 0
else
    echo "Ошибка: Файл system_set.sh не найден."
    exit 1
fi