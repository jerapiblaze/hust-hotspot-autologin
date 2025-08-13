#!/bin/bash

url='https://192.168.141.1/login'
checkurl='https://192.168.141.1/login'
username=''
password=''

#echo "username=${username}"
echo "Hust connect script | $(date)"

CHECK=$(curl -s 192.168.141.1/login | grep "You are logged in" | wc -l)

if [[ "${CHECK}" == "0" ]]; then
  echo "Not logged in, connecting with username=${username}"
  curl -s --request POST -d "username=${username}&password=${password}" $url
  echo "Request sent."
fi
echo "Script ended."