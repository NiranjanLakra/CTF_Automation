# What is Does
# It tries all the wordlists defined in a specific directory
# and helps offload the manual task 

#!/bin/bash

directory='/usr/share/wordlists/dirb' #
exclusion_list=("extensions_common.txt" "mutations_common.txt")   #Edit it to exclude the files from being used as wordlist

for file in "$directory"/*.txt;do
        for file2 in "${exclusion_list[@]}"; do
                if [[ "$file" == "$directory/$file2" ]]; then
                        no_go=1
                fi
        done
        if [[ no_go -eq 1 ]] ; then
                echo "Skipping $file"
        else
                echo "Processing $file"
                gobuster dir -u http://10.10.10.10/ -w "$file" -x xml,c,jhtml,phtml,htm,mdb,exe,pl,shtml,nsf,sh,sql,log,reg,asp,com,html,cfm,inc,jsa,php,aspx,bat,dll,txt,cgi,css,hta,js,jsp,pcap,php2,php3,php4,php5,php6,php7,phps,shtml,swf
                  #modify the above to suit your needs
                wait
        fi
                no_go=0
done
