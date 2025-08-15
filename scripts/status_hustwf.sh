#!/bin/bash

login_ip=192.168.141.1

url=http://$login_ip/status

content=$(curl -s $url)

connectstatus=$(echo $content | grep -o 'Hi, ' | wc -l)

ip=$(echo $content | grep -oP '(\d+\.\d+\.\d+\.\d+)')

timeleft_str=$(echo $content | grep -oP '(\d+(m)\d+(s))|(\d+(h)\d+(m)\d+(s))|(\d+(s))')
timeleft_arr=()
for i in $timeleft_str; do timeleft_arr+=($i); done

# prometheus-like
echo "hust_connectivity{ip=\"$ip\", time_connected=\"${timeleft_arr[0]}\", time_left=\"${timeleft_arr[1]}\", bytes_up=\"${datavol_arr[0]} ${datavol_arr[1]}\", bytes_down=\"${datavol_arr[2]} ${datavol_arr[3]}\" , login_ip=\"${login_ip}\"} ${connectstatus}"
