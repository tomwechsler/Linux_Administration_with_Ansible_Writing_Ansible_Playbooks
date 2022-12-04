#Lets create a script

vim shell.sh

#!/bin/bash
sudo timedatectl set-timezone 'Europe/Zurich'
sudo yum install -y tree

chmod +x shell.sh

A simple script can easily be run on a single distribution.

#If the following error appears => Module yaml error: Unexpected key in data: static_context [line 9 col 3]

#Update the following:
sudo yum update libmodulemd