#!/bin/bash

func_check(){
  if [[ $1 =~ ^[+-]?[0-9.]+$ ]]
  then
    return 1
  else
    return 0
  fi
}
