#! /usr/bin/expect -f

set cmd [lindex $argv 0];

set timeout 120
spawn ssh -o StrictHostKeyChecking=no root@192.168.0.22
expect "root*word:"
send -- "calvin\r"
expect "*/admin1->*"
send -- "$cmd \r"
expect "*/admin1->*"
send -- "\r \r"
