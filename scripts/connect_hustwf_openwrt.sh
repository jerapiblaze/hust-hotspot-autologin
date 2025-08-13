#!/bin/bash

url='https://192.168.141.1/login'
checkurl='https://192.168.141.1/login'
username=''
password=''

logger "Hust_connect: start at $(date)"

CHECK=$(curl -s 192.168.141.1/login | grep "You are logged in" | wc -l)

if [[ "${CHECK}" == "0" ]]; then
  logger "Hust_connect: Not logged in, connecting with username=${username} to ${url}"
  curl -s --request POST -d "username=${username}&password=${password}" $url
  logger "Hust_connect: Request sent, expecting an Internet connection."
fi
logger "Hust_connect: end."