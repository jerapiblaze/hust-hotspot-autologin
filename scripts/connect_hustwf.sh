#!/bin/zsh

url='https://bknet77.hust.edu.vn/login'
checkurl='https://bknet77.hust.edu.vn/status'
username='your_hust_username_aka_email_without_@sis_hust_edu_vn_or_@hust_edu_vn'
password='your_password'

echo "Hust connect script | $(date)"

CHECK=$(curl -s $checkurl)

if [[ "${CHECK}" == *"Error 302"* ]]; then
  echo "Not logged in, connecting with username=${username}" 
  curl -s --request POST -d "username=${username}&password=${password}" $url
  echo "Request sent."
fi
echo "Script ended."
