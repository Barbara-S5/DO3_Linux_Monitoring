#!/bin/bash

func_answ(){
    source ./system_set.sh

    func_info > "$(date '+%d_%m_%y_%H_%M_%S').status"
}
