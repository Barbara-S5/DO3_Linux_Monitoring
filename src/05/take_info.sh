source ./folder_info.sh
path=$1
start_time=$(date +%s.%N)
Total_folders=$(find "$path" -type d |  wc -l) 
T_5_folders=$(du -h "$path" | sort -hr | head -n 5 | awk '{printf "%d - %s, %s\n", FNR, $2, $1}')
Tot_files=$(find "$path" -type f | wc -l) 
Conf_files=$(find "$path" -type f | grep '.conf' | wc -l)
Text_files=$(find "$path" -type f | grep '.txt' | wc -l)
Execut_files=$(find "$path" -type f -executable | wc -l)
Log_files=$(find "$path" -type f | grep '.log' | wc -l)
Archive_files=$(find "$path" -type f | grep -E '\.(zip|tar|rar|7z)$' | wc -l)
Symbolic_link=$(find "$path" -type l | wc -l)
Biggest_files=$(find "$path" -type f -exec du -hs {} + | sort -hr | head -n 10 |{
    i=1
    while read -r size filepath; do
        type=$(file -b --mime-type "$filepath" | sed 's|/.*||')
        ext=$([[ "$filepath" =~ \.([a-zA-Z0-9]+)$ ]] && echo "${BASH_REMATCH[1]}" || echo "noext")
        printf "%2d - %s, %s, %s\n" "$i" "$filepath"  "$size" "$ext"
        ((i++))
    done
})
Biggest_ex_files=$(find "$path" -type f -executable -exec du -hs {} + | sort -hr | head -n 10 |{
    i=1
    while read -r size filepath; do
        hash=$(sha256sum "$filepath" |  awk '{print $1}' | cut -c1-32 || echo "N/A")
        printf "%2d - %s, %s, %s\n" "$i" "$filepath"  "$size" "$hash"
        ((i++))
    done
})