MYVAR=' myval;ls -l /etc/hosts'

ansible rhel -m shell -a "echo $MYVAR" 

192.168.33.11 | CHANGED | rc=0 >> 
myval
-rw-r--r--. 1 root root 188 Dec 29 2020 /etc/hosts

ansible rhel -m command -a "echo $MYVAR" 

192.168.33.11 | CHANGED | rc=0 >> 
myval;ls -l /etc/hosts



The command module is considered more secure as it can prevent injection of commands via
variables and strategically place semi-colons.