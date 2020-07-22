#!/bin/bash
# author: marvel gulane
# memory and cpu load consumption email alert

free=$(free -mt | grep Total | awk '{print $4}')
receiver=("okeykayow101@gmail.com" "drey01814@gmail.com")
    
if [[ "$free" -le 500  ]]; then
        ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head >/tmp/top_proccesses_consuming_memory.txt
        file=/tmp/top_proccesses_consuming_memory.txt
	    echo -e "Warning, server memory is running low.\n\nFree memory: $free MB\n\nServer: xero.qoneq.com" | mail -s "Alert Singapore Staging Server AWS LOW MEMORY" -a "from:xero-qoneq" "${receiver[0]}"
		echo -e "Warning, server memory is running low.\n\nFree memory: $free MB\n\nServer: xero.qoneq.com" | mail -s "Alert Singapore Staging Server AWS LOW MEMORY" -a "from:xero-qoneq" "${receiver[1]}"
fi

cpu=$(cat /proc/loadavg | awk '{print $1}') 

if [[ "$cpu" == 80 ]]; then
	echo -e "Warning, server cpu is running high.\n\nCpu Load: $cpu %"| mail -s "Alert Singapore Staging Server AWS High CPU Usage" -a "from:xero-qoneq" "${receiver[0]}"
	echo -e "Warning, server cpu is running high.\n\nCpu Load: $cpu %"| mail -s "Alert Singapore Staging Server AWS High CPU Usage" -a "from:xero-qoneq" "${receiver[1]}"
fi
exit 0

