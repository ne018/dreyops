#!/bin/bash
# author: marvel gulane
accesslog="/var/log/nginx/access.log"
compressed='/var/log/nginx/access.log.1'
responsecode=("200" "400" "404" "500" "206" "301")
log="logs.txt"
rm $log
<<END
function scanner() {
    backdoor=(  "posix_mkfifo(" "posix_getlogin(" "posix_ttyname" 
                "eval(unescape" "eval(base64_decode" "eval(deobfusecate" 
                "fwrite(" "cmd(" "passthru(" "exec(" "curl(" "system(" 
                "phpinfo(" "chmod(" "mkdir(" "fopen(" "fclose(" "readfile(" 
                "edoced_46esab(" "create_function(" "mysql_execute(" 
                "php_uname(" "php_uname(" "popen(" "pcntl_exec(" 
                "possix_mkfifo(" "posix_getlogin(" "posix_ttyname(" 
                "getenv(" "get_current_user(" "proc_get_status(" 
                "disk_free_space(" "disk_total_space(" "diskfreespace("
                "getcwd(" "getlastmo(" "getmygid(" "getmypid(" 
                "getmyuid(" "assert(" "extract(" "parse_str(" 
                "putenv(" "ini_set(" "pfsockopen(" "fsockopen(" 
                "apache_child_terminate(" "posix_kill(" 
                "gethostname(" "posix_setpgid" "posix_setsid" "posix_setuid" 
                "tmpfile(" "copy(" "md5_file(" "sha1_file(" 
                "show_source(" "str_repeat(" "unserialize(" "pcntl_exec(" )
        
    echo -e "\n\n<b style='font-size:12px'>Web shell backdoor server inspection result\n" >> $log    
    for payload in "${backdoor[@]}"; do
            find $HOME -name "*.js" 2>/dev/null |\ 
                xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /var/www/html -name "*.js" 2>/dev/null |\ 
                xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /usr/share -name "*.js" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /tmp -name "*.js" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find $HOME -name "*.php" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /var/www -name "*.php" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /usr/share -name "*.php" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /tmp -name "*.php" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find $HOME -name "*.txt" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /var/www -name "*.txt" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /usr/share -name "*.txt" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
            find /tmp -name "*.txt" 2>/dev/null |\
                 xargs grep -rnxe "$payload" 2>/dev/null >> $log
    done;
END

function status() {
    echo -e "\n\n<b style='font-size:12px'>The server status in the last 24 hours information in cpu and memory</b>\n" >> $log
    info=$(lsb_release -a 2>/dev/null)
    cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
    ram=$(cat /proc/meminfo  | head -n 7)
    network=$(ss -t -a | awk {'print $4"...established..."$5'})
    services=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head)
    echo -e "$info\nCpuTotal:    $cpu\n$ram" >> $log
    echo -e "\n\n<b style='font-size:12px'>The server network status report and inspection for any malicious connection</b>\n" >> $log
    echo -e "$network" >> $log
    echo -e "\n\n<b style='font-size:12px'>The top most consuming service within the server current status</b>\n" >> $log
    echo -e "$services" >> $log

}

function requests() { 
    echo -e "<br>\n\n<b style='font-size:12px'>Most ip visitors in the last 24 hours based in /var/log/access.log file</b>\n</br>" >> $log
    for statuscode in "${responsecode[@]}"; do
        echo -e "\n<b style='font-size:12px'> <li>Most ip request in status code : $statuscode</li></b>\n" >> $log
        #grep $compressed -e $statuscode | sort -urn | awk {'print $1'} | head -10 >> $log
        grep $compressed -e "$statuscode" |\
            sort -urn |\
            awk {'print $1'} |\
            head -n 10 |\
            while read ip; do curl -s https://ipinfo.io/$ip |\
                jq -r '.country +"\t city:"+.city +"\t region:"+.region +"\t org:"+.org +"\t timezone:"+.timezone' |\
                while read info; do echo -e "$ip \t $info"; done ; done >> $log
    done
}

function getrequest(){
    echo -e "\n\n<br><b style='font-size:12px'>Most ip request in (GET) method request in the last 24 hours</b>\n" >> $log
    grep $compressed -e "GET" |\
        sort -urn |\
        awk {'print $1'} |\
        head -10 |\
        while read ip; do curl -s https://ipinfo.io/$ip |\
            jq -r '.country +"\t city:"+.city +"\t region:"+.region +"\t org:"+.org +"\t timezone:"+.timezone' |\
            while read info; do echo -e "$ip \t $info"; done ; done >> $log
}

function badrequest(){
    echo -e "\n\n<b style='font-size:12px'>Most ip request in (POST) method request in the last 24 hours</b>\n" >> $log
    grep $compressed -e "POST" |\
        sort -urn |\
        awk {'print $1'} |\
        head -10 |\
        while read ip; do curl -s https://ipinfo.io/$ip |\
            jq -r '.country +"\t city:"+.city +"\t region:"+.region +"\t org:"+.org +"\t timezone:"+.timezone' |\
            while read info; do echo -e "$ip \t $info"; done ; done >> $log
}

function pages(){
    echo -e "\n\n<b style='font-size:12px'>The most request pages in the last 24 hours nginx webserver</b\n>" >> $log
    cat $accesslog |\
        awk {'print $7'} |\
        sort -ur |\
        head -10 >> $log
}

function allpages(){
    echo -e "\n\n<b style='font-size:12px'>The most pages request in all logs nginx webserver</b>\n" >> $log
    cat $compressed |\
        awk {'print $7'} |\
        sort -ur |\
        head -10 >> $log
}

function modified() {
    day=$(date "+%Y-%m-%d")
    directory=("." "/etc" "/tmp" "/usr/share" "/opt" "/home")
    echo -e "\n\n<br><b style='font-size:12px'><br></br><br>Files that were modified in the last 24 hours with full location</b>\n" >> $log
    for contents in "${directory[@]}";do
        find $contents -type f -printf '%TY-%Tm-%Td %p\n' 2>/dev/null |\
            sort -r |\
            grep "${day}" 2>/dev/null >> $log
    done;
} 

function main() {
    #scanner
    status
    requests
    getrequest
    badrequest
    pages
    allpages
    modified
    ip=$(curl -s icanhazip.com)
    subject="Security Singapore Staging Server AWS $ip"
    sender="from:xero-qoneq"
    receiver=("okeykayow101@gmail.com" "drey01814@gmail.com")
    message=$(cat logs.txt)
    echo "<pre style='font-size:8px'>$message</pre>" |\
        mail -s "$(echo -e "$subject\nContent-Type: text/html")" -a $sender "${receiver[0]}"
    echo "$message" |\
        mail -s "$(echo -e "$subject\nContent-Type: text/html")" -a $sender "${receiver[1]}"
}

main
exit
