#!/bin/bash 

source ./system_set.sh
source ./func_answer.sh

if [ $# -eq 0 ]; then
    if [ -f system_set.sh ]; then 
        func_info
        echo "Do you want to write it to a file? (Y/N)"
        read answer
        if [[ $answer == 'Y' || $answer == 'y' ]]; then
            func_answ
        fi
    fi
else 
    echo "Too many parametrs in the command line"
fi