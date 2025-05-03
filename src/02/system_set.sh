#!/bin/bash

func_info(){
    echo "HOSTNAME =" $HOSTNAME 
    echo "TIMEZONE =" $(timedatectl show --property=Timezone --value) "UTC" $(date +%z | sed 's/\([+-]\{0,1\}.\{2\}\).*/\1/' | sed 's/^+0/+/; s/^-0/-/')
    echo "USER =" $USER
    echo "OS =" $(cat /etc/issue)
    echo "DATE =" $(date +'%d %B %Y %R:%S')
    echo "UPTIME =" $(uptime -p | sed 's/up //')
    echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime) seconds"
    echo "IP =" $(hostname -I | awk '{print $1}' | sed -n '1p')
    echo "MASK =" $(ifconfig | grep -w "inet" | awk '{print $4}' | sed -n '1p')  
    echo "GATEWAY =" $(ip route | grep 'default via' | awk '{print $3}' | sed -n '1p')
    echo "RAM_TOTAL =" $(vmstat -s | grep 'total memory' | awk '{printf "%.3f GB", $1/1048576}')
    echo "RAM_USED =" $(vmstat -s | grep 'used memory' | awk '{printf "%.3f GB", $1/1048576}')
    echo "RAM_FREE =" $(vmstat -s | grep 'free memory' | awk '{printf "%.3f GB", $1/1048576}')
    echo "SPACE_ROOT =" $(df -m / | grep '/dev/' | awk '{printf "%.2f M", $2}')
    echo "SPACE_ROOT_USED =" $(df -m / | grep '/dev/' | awk '{printf "%.2f M", $3}')
    echo "SPACE_ROOT_FREE =" $(df -m / | grep '/dev/' | awk '{printf "%.2f M", $2}')
}