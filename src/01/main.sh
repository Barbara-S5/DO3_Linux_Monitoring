#!/bin/bash

source ./incorrect_input.sh  

func_check "$1"

if [[ $? -eq 0 ]]
then
echo "$1"
else
echo "Inccorrect input" 
fi

# Доработать скрипт на ошибку ввода, и испробовать на линухе