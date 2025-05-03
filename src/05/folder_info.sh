#!/bin/bash

func_fold_info(){
    echo "Total number of folders (including all nested ones) =" ${Total_folders} 
    echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n${T_5_folders}"
    echo "Total number of files = "${Tot_files}
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = "${Conf_files}
    echo "Text files = "${Text_files}
    echo "Executable files = "${Execut_files}
    echo "Log files (with the extension .log) = "${Log_files}
    echo "Archive files = "${Archive_files}
    echo "Symbolic links = "${Symbolic_link}
    echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):\n${Biggest_files}"
    echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n${Biggest_ex_files}"

    end_time=$(date +%s.%N)
    Execut_time=$(echo "$end_time - $start_time" | bc -l) 
    printf "Script execution time (in seconds) = %.3f\n" "$Execut_time"
}