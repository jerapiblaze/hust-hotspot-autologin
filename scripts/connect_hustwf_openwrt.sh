#!/bin/bash

url='https://192.168.141.1/login'
checkurl='https://192.168.141.1/login'
username=''
password=''
attempts=15

echo "Hust connect script | $(date)"

while [[ "$(curl -s 192.168.141.1/login | grep "You are logged in" | wc -l)" == "0" ]]; do
  echo "Not logged in, connecting with username=${username}"
  curl -s --request POST -d "username=${username}&password=${password}" $url
  echo "Request sent (remaining attempts: $attempts), expecting internet connection..."
  sleep 5s
  attempts-=1
  if [[ $attempts -le 0 ]]; then
    break
  fi
done
echo "Script ended."