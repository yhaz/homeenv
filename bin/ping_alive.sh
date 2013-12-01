# usage: ping-alive.sh <host_list_filename>

nmap -sP -oG - `cat $1`
