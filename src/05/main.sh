#!/bin/bash

source ./take_info.sh

if ! [ $# -eq 1 ]; then
    echo "The script works only with one argument"
    exit 1
fi

if [[ "$1" != */ ]]; then
    echo "The end of the argument must have a sign like this. '/'."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "That directory does not exist"
    exit 1
fi

func_fold_info